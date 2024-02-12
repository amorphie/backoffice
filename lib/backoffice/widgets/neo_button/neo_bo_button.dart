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
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';

import 'bloc/neo_bo_button_bloc.dart';
import 'i_neo_bo_button.dart';
import 'model/neo_bo_button_display_mode.dart';
import 'model/neo_bo_button_size.dart';

class NeoBoButton extends INeoBoButton {
  const NeoBoButton({
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
    super.autoTriggerTransition,
    super.padding,
    super.key,
  });

  @override
  Widget Function(BuildContext, NeoBoButtonState) get childBuilder => (context, state) => SizedBox(
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
                border: displayMode == NeoBoButtonDisplayMode.line
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
                          ? displayMode == NeoBoButtonDisplayMode.primary
                              ? NeoColors.iconPrimaryGreen
                              : NeoColors.iconDefault
                          : NeoColors.iconDisabled,
                    ).paddingOnly(start: NeoDimens.px24),
                  Text(labelText, style: _labelTextStyle(state.buttonEnabled ?? enabled)).paddingSymmetric(horizontal: NeoDimens.px12),
                  if (!iconRightUrn.isNullOrBlank)
                    NeoIcon(
                      height: NeoDimens.px20,
                      width: NeoDimens.px20,
                      iconUrn: iconRightUrn!,
                      color: state.buttonEnabled ?? enabled
                          ? displayMode == NeoBoButtonDisplayMode.primary
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
    return switch (size) { NeoBoButtonSize.small => NeoDimens.px40, NeoBoButtonSize.medium => NeoDimens.px44, NeoBoButtonSize.large => NeoDimens.px48 };
  }

  Color? _getBackgroundColor(bool buttonEnabled) {
    if (buttonEnabled) {
      return switch (displayMode) {
        NeoBoButtonDisplayMode.primary => NeoColors.bgDarker,
        NeoBoButtonDisplayMode.secondary => NeoColors.bgPrimaryGreen,
        NeoBoButtonDisplayMode.line => Colors.transparent,
        NeoBoButtonDisplayMode.textBold => Colors.transparent,
        NeoBoButtonDisplayMode.textRegular => Colors.transparent
      };
    } else {
      return NeoColors.bgDisabled;
    }
  }

  Color? _getSplashColor() {
    return switch (displayMode) {
      NeoBoButtonDisplayMode.primary => NeoColors.textDefault,
      NeoBoButtonDisplayMode.secondary => NeoColors.bgPrimaryGreenDark,
      NeoBoButtonDisplayMode.line => NeoColors.bgPrimaryBlackLight,
      NeoBoButtonDisplayMode.textBold => null,
      NeoBoButtonDisplayMode.textRegular => null
    };
  }

  TextStyle _labelTextStyle(bool buttonEnabled) {
    return _getTextStyle(
      displayMode == NeoBoButtonDisplayMode.textRegular ? NeoTextStyles.labelFourteenRegular : NeoTextStyles.labelFourteenSemibold,
      buttonEnabled
          ? displayMode == NeoBoButtonDisplayMode.primary
              ? NeoColors.textPrimaryGreen
              : NeoColors.textDefault
          : NeoColors.textSecondary,
    );
  }

  TextStyle _getTextStyle(TextStyle baseStyle, Color color) {
    return switch (size) {
      NeoBoButtonSize.small => baseStyle.apply(color: color),
      NeoBoButtonSize.medium => baseStyle.apply(color: color),
      NeoBoButtonSize.large => NeoTextStyles.labelSixteenSemibold.apply(color: color)
    };
  }
}
