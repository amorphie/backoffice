/*
 *
 * neo_bank
 *
 * Created on 28/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 *
 */

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_terms_and_conditions_group/models/neo_terms_and_conditions_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_terms_and_conditions_group/network/neo_terms_and_conditions_group_network_manager.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event_bus.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

abstract class _Constants {
  static const documentListKey = "documents";
  static const documentTempTokenKey = "tempToken";
}

class NeoTermsAndConditionsGroup extends StatefulWidget {
  final String transitionId;
  final String buttonLabelText;

  const NeoTermsAndConditionsGroup({
    required this.transitionId,
    this.buttonLabelText = "",
    Key? key,
  }) : super(key: key);

  @override
  State<NeoTermsAndConditionsGroup> createState() => _NeoTermsAndConditionsGroupState();
}

class _NeoTermsAndConditionsGroupState extends State<NeoTermsAndConditionsGroup> with SingleTickerProviderStateMixin {
  late final NeoTermsAndConditionsGroupNetworkManager networkManager = NeoTermsAndConditionsGroupNetworkManager();

  late final List<NeoTermsAndConditionsItemData> documentList =
      (context.read<WorkflowFormBloc>().formData[_Constants.documentListKey] as List).map((e) => NeoTermsAndConditionsItemData.fromJson(e)).toList();

  late final List<String> documentUrlList = documentList.map((e) => e.filePath).toList();

  late final String token = context.read<WorkflowFormBloc>().formData[_Constants.documentTempTokenKey] as String;

  late final TabController _tabController = TabController(length: documentUrlList.length, vsync: this);

  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  String base64Content = "";

  @override
  void initState() {
    super.initState();
    _listenButtonPressEvents();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyWithTabs();
  }

  Widget _buildBodyWithTabs() {
    final List<Widget> tabWidgets = [];
    for (int i = 0; i < _tabController.length; i++) {
      tabWidgets.add(_buildPdfViewWithContinueButton(i));
    }
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: tabWidgets,
    );
  }

  Widget _buildPdfViewWithContinueButton(int index) {
    return FutureBuilder<String>(
      future: networkManager.fetchPdfContentWithUrl(documentUrlList[index]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        base64Content = snapshot.data!;
        return Column(
          children: <Widget>[
            Expanded(
              child: PDFView(
                pdfData: Uint8List.fromList(base64.decode(base64Content)),
                pageFling: false,
                onPageChanged: (int? pageIndex, int? totalPageCount) {
                  if (pageIndex == (totalPageCount ?? 0) - 1) {
                    _setButtonEnabledStatus(true);
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: NeoButton(
                    transitionId: widget.transitionId,
                    labelText: widget.buttonLabelText,
                    enabled: false,
                    widgetEventKey: NeoWidgetEventKeys.termsAndConditionsPressContinueButton.name,
                    autoTriggerTransition: false,
                  ).paddingOnly(
                    start: NeoDimens.px24,
                    end: NeoDimens.px24,
                    bottom: NeoDimens.px24,
                    top: NeoDimens.px16,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _setButtonEnabledStatus(bool isEnabled) {
    NeoWidgetEventKeys.neoButtonChangeEnableStatusEventKey.sendEvent(data: isEnabled);
  }

  void _listenButtonPressEvents() {
    _neoWidgetEventSubscription = NeoWidgetEventKeys.termsAndConditionsPressContinueButton.listenEvent(
      onEventReceived: (_) async {
        final tabIndex = _tabController.index;
        if (tabIndex == documentUrlList.length - 1) {
          await _postDocumentReadStatus(tabIndex);
          getIt.get<NeoWidgetEventBus>().addEvent(
                NeoWidgetEvent(
                  eventId: NeoWidgetEventKeys.neoButtonStartTransition.name,
                  data: widget.transitionId,
                ),
              );
        } else {
          unawaited(_postDocumentReadStatus(tabIndex));
          _setButtonEnabledStatus(false);
          _tabController.animateTo(_tabController.index + 1);
        }
      },
    );
  }

  Future<void> _postDocumentReadStatus(int tabIndex) {
    return networkManager.postDocumentReadStatus(
      itemData: documentList[tabIndex],
      token: token,
      fileContext: base64Content,
    );
  }

  @override
  void dispose() {
    _neoWidgetEventSubscription?.cancel();
    super.dispose();
  }
}
