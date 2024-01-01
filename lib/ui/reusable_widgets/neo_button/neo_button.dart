/*
 * 
 * Neobank.Client
 * 
 * Created on 28/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:admin/ui/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:admin/ui/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:admin/ui/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/core/util/neo_util.dart';

class NeoButton extends INeoButton {
  const NeoButton({
    super.transitionId,
    super.widgetEventKey,
    super.labelText,
    super.iconLeftUrn,
    super.iconRightUrn,
    super.size,
    super.displayMode,
    super.enabled,
    super.formValidationRequired,
    super.startWorkflow,
    super.padding,
    super.key,
  });

  @override
  Widget Function(BuildContext, NeoButtonState) get childBuilder => (context, state) => SizedBox(
        height: _buttonHeight(),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NeoRadius.px12)),
            onTap: () => state.buttonEnabled ?? enabled ? startTransition(context) : null,
            splashColor: _getSplashColor(),
            child: Ink(
              decoration: BoxDecoration(
                color: _getBackgroundColor(state.buttonEnabled ?? enabled),
                borderRadius: BorderRadius.circular(NeoRadius.px8),
                border: displayMode == NeoButtonDisplayMode.line
                    ? Border.all(
                        color: state.buttonEnabled ?? enabled ? NeoColors.textDefault : NeoColors.borderDisabled,
                        width: 2,
                      )
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!iconLeftUrn.isNullOrBlank)
                    NeoIcon(
                      height: NeoDimens.px20,
                      width: NeoDimens.px20,
                      iconUrn: iconLeftUrn!,
                      color: state.buttonEnabled ?? enabled
                          ? displayMode == NeoButtonDisplayMode.primary
                              ? NeoColors.iconPrimaryGreen
                              : NeoColors.iconDefault
                          : NeoColors.iconDisabled,
                    ).paddingOnly(start: NeoDimens.px24),
                  Text(labelText, style: _labelTextStyle(state.buttonEnabled ?? enabled))
                      .paddingSymmetric(horizontal: NeoDimens.px12),
                  if (!iconRightUrn.isNullOrBlank)
                    NeoIcon(
                      height: NeoDimens.px20,
                      width: NeoDimens.px20,
                      iconUrn: iconRightUrn!,
                      color: state.buttonEnabled ?? enabled
                          ? displayMode == NeoButtonDisplayMode.primary
                              ? NeoColors.iconPrimaryGreen
                              : NeoColors.iconDefault
                          : NeoColors.iconDisabled,
                    ).paddingOnly(end: NeoDimens.px24),
                ],
              ),
            ),
          ),
        ),
      ).padding(padding ?? EdgeInsetsDirectional.zero);

  @override
  void onTransitionError(BuildContext context, String errorMessage) {
    // No-op. Override if necessary
  }

  double _buttonHeight() {
    return switch (size) {
      NeoButtonSize.small => NeoDimens.px40,
      NeoButtonSize.medium => NeoDimens.px44,
      NeoButtonSize.large => NeoDimens.px48
    };
  }

  Color? _getBackgroundColor(bool buttonEnabled) {
    if (buttonEnabled) {
      return switch (displayMode) {
        NeoButtonDisplayMode.primary => NeoColors.bgDarker,
        NeoButtonDisplayMode.secondary => NeoColors.bgPrimaryGreen,
        NeoButtonDisplayMode.line => Colors.transparent,
        NeoButtonDisplayMode.textBold => Colors.transparent,
        NeoButtonDisplayMode.textRegular => Colors.transparent
      };
    } else {
      return NeoColors.bgDisabled;
    }
  }

  Color? _getSplashColor() {
    return switch (displayMode) {
      NeoButtonDisplayMode.primary => NeoColors.textDefault,
      NeoButtonDisplayMode.secondary => NeoColors.bgPrimaryGreenDark,
      NeoButtonDisplayMode.line => NeoColors.bgPrimaryBlackLight,
      NeoButtonDisplayMode.textBold => null,
      NeoButtonDisplayMode.textRegular => null
    };
  }

  TextStyle _labelTextStyle(bool buttonEnabled) {
    return _getTextStyle(
      displayMode == NeoButtonDisplayMode.textRegular
          ? NeoTextStyles.labelFourteenRegular
          : NeoTextStyles.labelFourteenSemibold,
      buttonEnabled
          ? displayMode == NeoButtonDisplayMode.primary
              ? NeoColors.textPrimaryGreen
              : NeoColors.textDefault
          : NeoColors.textSecondary,
    );
  }

  TextStyle _getTextStyle(TextStyle baseStyle, Color color) {
    return switch (size) {
      NeoButtonSize.small => baseStyle.apply(color: color),
      NeoButtonSize.medium => baseStyle.apply(color: color),
      NeoButtonSize.large => NeoTextStyles.labelSixteenSemibold.apply(color: color)
    };
  }
}
