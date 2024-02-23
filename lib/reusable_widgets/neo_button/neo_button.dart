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
import 'package:backoffice/core/navigation/usecases/navigate_with_event_bus_navigation_handler_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_enable_state.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const double borderWidth = 2;
}

class NeoButton extends INeoButton {
  final Function? onTap;

  const NeoButton({
    this.onTap,
    super.navigationPath,
    super.navigationType,
    super.transitionId,
    super.widgetEventKey,
    super.labelText,
    super.iconLeftUrn,
    super.iconRightUrn,
    super.size,
    super.displayMode,
    super.enableState,
    super.formValidationRequired,
    super.startWorkflow,
    super.autoTriggerTransition,
    super.padding,
    super.key,
  });

  @override
  Widget Function(BuildContext, NeoButtonState) get childBuilder => (context, state) => SizedBox(
        height: _buttonHeight(),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NeoRadius.px8)),
            onTap: () {
              onTap?.call();
              startTransition(context);
              if (!navigationPath.isNullOrBlank) {
                NavigateWithEventBusNavigationHandlerUseCase.call(navigationType, navigationPath!);
              }
            },
            splashColor: _getSplashColor(),
            child: _buildNeoButton(state),
          ),
        ),
      ).padding(padding ?? EdgeInsetsDirectional.zero);

  Widget _buildNeoButton(NeoButtonState state) {
    return Ink(
      decoration: BoxDecoration(
        color: _getBackgroundColor(_isButtonEnabled(state)),
        borderRadius: BorderRadius.circular(NeoRadius.px8),
        border: _getBorder(_isButtonEnabled(state)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!iconLeftUrn.isNullOrBlank) _buildIcon(iconLeftUrn!, _isButtonEnabled(state)).paddingOnly(end: _iconPadding()),
          Flexible(
            child: NeoText(
              labelText,
              style: _labelTextStyle(_isButtonEnabled(state)),
              maxLines: 1,
            ),
          ),
          if (!iconRightUrn.isNullOrBlank) _buildIcon(iconRightUrn!, _isButtonEnabled(state)).paddingOnly(start: _iconPadding()),
        ],
      ).paddingSymmetric(horizontal: NeoDimens.px24),
    );
  }

  Widget _buildIcon(String iconUrn, bool buttonEnabled) {
    return NeoIcon(
      height: NeoDimens.px20,
      width: NeoDimens.px20,
      iconUrn: iconUrn,
      color: _getIconColor(buttonEnabled),
    );
  }

  double _iconPadding() {
    return switch (size) { NeoButtonSize.xSmall => NeoDimens.px4, NeoButtonSize.small => NeoDimens.px12, NeoButtonSize.medium => NeoDimens.px12, NeoButtonSize.large => NeoDimens.px12 };
  }

  double _buttonHeight() {
    return switch (size) { NeoButtonSize.xSmall => NeoDimens.px28, NeoButtonSize.small => NeoDimens.px40, NeoButtonSize.medium => NeoDimens.px44, NeoButtonSize.large => NeoDimens.px48 };
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
      NeoButtonDisplayMode.primary => NeoColors.bgDarker,
      NeoButtonDisplayMode.secondary => NeoColors.bgPrimaryGreenDark,
      NeoButtonDisplayMode.line => NeoColors.bgPrimaryBlackLight,
      NeoButtonDisplayMode.textBold => null,
      NeoButtonDisplayMode.textRegular => null
    };
  }

  Color _getIconColor(bool buttonEnabled) {
    if (!buttonEnabled) {
      return NeoColors.iconDisabled;
    }
    if (displayMode == NeoButtonDisplayMode.primary) {
      return NeoColors.iconPrimaryGreen;
    }
    return NeoColors.iconDefault;
  }

  Border? _getBorder(bool buttonEnabled) {
    if (displayMode == NeoButtonDisplayMode.line) {
      return Border.all(
        color: buttonEnabled ? NeoColors.borderDarker : NeoColors.borderDisabled,
        width: _Constants.borderWidth,
      );
    }

    return null;
  }

  TextStyle _labelTextStyle(bool buttonEnabled) {
    return _getTextStyle(
      displayMode == NeoButtonDisplayMode.textRegular ? NeoTextStyles.labelFourteenRegular : NeoTextStyles.labelFourteenSemibold,
      buttonEnabled
          ? displayMode == NeoButtonDisplayMode.primary
              ? NeoColors.textPrimaryGreen
              : NeoColors.textDefault
          : NeoColors.textSecondary,
    );
  }

  TextStyle _getTextStyle(TextStyle baseStyle, Color color) {
    return switch (size) {
      NeoButtonSize.xSmall => NeoTextStyles.bodyElevenSemibold.apply(color: color),
      NeoButtonSize.small => baseStyle.apply(color: color),
      NeoButtonSize.medium => baseStyle.apply(color: color),
      NeoButtonSize.large => NeoTextStyles.labelSixteenSemibold.apply(color: color)
    };
  }

  bool _isButtonEnabled(NeoButtonState state) => state.enableState == NeoButtonEnableState.enabled || state.enableState == NeoButtonEnableState.enabledWithoutOnClick;
}
