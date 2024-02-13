/*
 * neo_bank
 *
 * Created on 23/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_item_model.dart';
import 'package:backoffice/core/navigation/navigation_helper.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/new_badge/new_badge_widget.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

abstract class _Constants {
  static const double iconSize = 12;
  static const double textMaxWidth = 120;
  static const int maxLines = 2;
  static const String transitionUrnPrefix = "urn:transaction:";
  static const String navigationUrnPrefix = "urn:page:";
}

// ignore_for_file: use_build_context_synchronously
class NeoBackofficeNavigationGroupItemWidget extends INeoButton {
  NeoBackofficeNavigationGroupItemWidget({
    required this.model,
    super.key,
  }) : super(transitionId: _parseTransitionId(model.action));

  final NeoNavigationGroupItemModel model;

  @override
  Widget Function(BuildContext, NeoButtonState) get childBuilder => (BuildContext context, state) => TextButton(
        style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NeoDimens.px32))),
        onPressed: () async {
          // var response = await NeoSearchNetworkManager().fetchItemList("user");
          // print(response);

          final configParameters = await model.getConfigParameters();

          _handleNavigation(
            context,
            navigationPath: _parseNavigationPath().formatWithQueryParams(configParameters),
          );
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Row(
              children: [_buildIcon(), const SizedBox(width: 10), _buildText()],
            ),
            if (model.isNew) const NewBadgeWidget(padding: EdgeInsets.zero).paddingOnly(bottom: 80, start: 40),
          ],
        ),
      );

  Widget _buildIcon() {
    return DecoratedBox(
      decoration: const ShapeDecoration(shape: CircleBorder(), color: NeoColors.iconDefault),
      child: NeoIcon(
        iconUrn: model.iconUrn,
        width: _Constants.iconSize,
        height: _Constants.iconSize,
        color: NeoColors.iconLight,
      ).paddingAll(NeoDimens.px12),
    );
  }

  Widget _buildText() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _Constants.textMaxWidth),
      child: Text(
        model.displayName,
        maxLines: _Constants.maxLines,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: NeoColors.textDefault, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
    ).paddingOnly(top: NeoDimens.px8);
  }

  @override
  void onTransitionError(BuildContext context, String errorMessage) {
    // No-op
  }

  _handleNavigation(BuildContext context, {required String navigationPath}) {
    getIt.get<NeoNavigationHelper>().navigate(
          context: context,
          navigationType: NeoNavigationType.push,
          navigationPath: navigationPath,
        );
  }

  static String _parseTransitionId(String action) {
    return action.contains(_Constants.transitionUrnPrefix) ? action.substring(_Constants.transitionUrnPrefix.length) : "";
  }

  String _parseNavigationPath() {
    final action = model.action;
    return action.contains(_Constants.navigationUrnPrefix) ? action.substring(_Constants.navigationUrnPrefix.length) : "";
  }
}
