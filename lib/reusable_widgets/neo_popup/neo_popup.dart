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
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
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
    return _buildPopupContent(context).padding(padding);
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
              NeoText(
                titleText,
                textAlign: TextAlign.center,
                style: NeoTextStyles.bodySixteenSemibold,
              ).paddingOnly(bottom: NeoDimens.px8),
            if (bodyText.isNotNull)
              NeoText(
                bodyText,
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
          NeoButton(
            onTap: () {
              if (action.dismissOnAction) {
                Navigator.of(context).pop();
              }
            },
            transitionId: action.transitionId,
            widgetEventKey: action.widgetEventKey,
            labelText: action.labelText,
            displayMode: action.displayMode,
          ).paddingOnly(bottom: index != actions!.length - 1 ? NeoDimens.px16 : NeoDimens.px0),
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
