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

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_action_model.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const double iconBackgroundSize = 80;
}

class NeoPopup extends StatelessWidget {
  final NeoPopupType type;
  final String? titleText;
  final String? bodyText;
  final List<NeoPopupActionModel>? actions;
  final EdgeInsetsDirectional padding;
  final bool isLocalPopup;

  const NeoPopup({
    super.key,
    this.type = NeoPopupType.info,
    this.titleText,
    this.bodyText,
    this.actions,
    this.padding = EdgeInsetsDirectional.zero,
    this.isLocalPopup = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLocalPopup
        ? Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NeoRadius.px16)),
            backgroundColor: NeoColors.textDefaultInverse,
            surfaceTintColor: Colors.transparent,
            child: _buildPopupContent(context),
          )
        : _buildPopupContent(context).padding(padding);
  }

  Widget _buildPopupContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIcon(),
        _buildPopupText(context),
        if (actions.isNotNull) _buildButtons(context),
      ],
    ).paddingAll(NeoDimens.px24);
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

  Widget _buildButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, action) in actions.orEmptyList.indexed)
          Listener(
            onPointerDown: (_) {
              if (action.dismissOnAction) {
                Navigator.of(context).pop();
              }
            },
            child: NeoButton(
              transitionId: action.transitionId,
              widgetEventKey: action.widgetEventKey,
              labelText: action.labelText,
              displayMode: action.displayMode,
            ).paddingOnly(bottom: index != actions!.length - 1 ? NeoDimens.px16 : NeoDimens.px0),
          ),
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
