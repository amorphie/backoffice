/*
 * Neobank.Client
 *
 * Created on 27/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_button/neo_button.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/ui/reusable_widgets/neo_popup/bloc/neo_popup_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_popup/model/neo_popup_action_model.dart';
import 'package:admin/ui/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:admin/core/util/neo_util.dart';

abstract class _Constants {
  static const double iconBackgroundSize = 80;
}

class NeoPopup extends StatelessWidget {
  final NeoPopupType type;
  final String? titleText;
  final String? bodyText;
  final List<NeoPopupActionModel>? actions;
  final EdgeInsetsDirectional padding;

  const NeoPopup({
    super.key,
    this.type = NeoPopupType.info,
    this.titleText,
    this.bodyText,
    this.actions,
    this.padding = EdgeInsetsDirectional.zero,
  });

  @override
  Widget build(BuildContext context) {
    final widgetEventKeys = actions?.map((e) => e.widgetEventKey).whereNotNull().toList();
    return BlocProvider(
      create: (context) => NeoPopupBloc()..add(NeoPopupEventInitialize(widgetEventKeys: widgetEventKeys)),
      child: BlocListener<NeoPopupBloc, NeoPopupState>(
        listener: (_, state) {
          if (state is NeoPopupStateDismiss) {
            Navigator.pop(context);
          }
        },
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NeoRadius.px16)),
          backgroundColor: NeoColors.textDefaultInverse,
          surfaceTintColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPopupContent(context),
              if (actions.isNotNull) _buildButtons(),
            ],
          ).paddingAll(NeoDimens.px24),
        ),
      ),
    ).padding(padding);
  }

  Widget _buildPopupContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIcon(),
        _buildPopupText(context),
      ],
    );
  }

  Widget _buildIcon() {
    return NeoIcon(
      iconUrn: _iconUrn,
      width: _Constants.iconBackgroundSize,
      height: _Constants.iconBackgroundSize,
    ).paddingOnly(bottom: NeoDimens.px12);
  }

  Widget _buildPopupText(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: _maxTextHeight(context)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (titleText.isNotNull)
              Text(
                titleText!,
                textAlign: TextAlign.center,
                style: NeoTextStyles.bodySixteenSemibold,
              ).paddingOnly(bottom: NeoDimens.px8),
            if (bodyText.isNotNull)
              Text(
                bodyText!,
                textAlign: TextAlign.center,
                style: NeoTextStyles.bodyFourteenMedium,
              ),
          ],
        ),
      ).paddingOnly(bottom: NeoDimens.px24),
    );
  }

  Widget _buildButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final action in actions.orEmptyList) ...[
          NeoButton(
            transitionId: action.transitionId,
            widgetEventKey: action.widgetEventKey,
            labelText: action.labelText,
            displayMode: action.displayMode,
          ).paddingOnly(bottom: NeoDimens.px4),
        ],
      ],
    );
  }

  String get _iconUrn => switch (type) {
        NeoPopupType.success => NeoAssets.popupIconSuccess.urn,
        NeoPopupType.info => NeoAssets.popupIconInfo.urn,
        NeoPopupType.warning => NeoAssets.popupIconWarning.urn,
        NeoPopupType.error => NeoAssets.popupIconError.urn,
      };

  double _maxTextHeight(BuildContext context) => MediaQuery.of(context).size.height / 3;
}
