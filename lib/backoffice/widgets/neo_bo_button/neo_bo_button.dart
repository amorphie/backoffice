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

import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

import 'bloc/neo_bo_button_bloc.dart';
import 'i_neo_bo_button.dart';
import 'model/neo_bo_button_display_mode.dart';
import 'model/neo_bo_button_enable_state.dart';
import 'model/neo_bo_button_size.dart';

abstract class _Constants {
  static const double borderWidth = 2;
}

class NeoBoButton extends INeoBoButton {
  final Function? onTap;

  const NeoBoButton({
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
  Widget Function(BuildContext, NeoBoButtonState) get childBuilder => (context, state) => SizedBox(
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
            child: _buildNeoBoButton(state),
          ),
        ),
      ).padding(padding ?? EdgeInsetsDirectional.zero);

  Widget _buildNeoBoButton(NeoBoButtonState state) {
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
    return switch (size) {
      NeoBoButtonSize.xSmall => NeoDimens.px4,
      NeoBoButtonSize.small => NeoDimens.px12,
      NeoBoButtonSize.medium => NeoDimens.px12,
      NeoBoButtonSize.large => NeoDimens.px12
    };
  }

  double _buttonHeight() {
    return switch (size) {
      NeoBoButtonSize.xSmall => NeoDimens.px28,
      NeoBoButtonSize.small => NeoDimens.px40,
      NeoBoButtonSize.medium => NeoDimens.px44,
      NeoBoButtonSize.large => NeoDimens.px48
    };
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
      NeoBoButtonDisplayMode.primary => NeoColors.bgDarker,
      NeoBoButtonDisplayMode.secondary => NeoColors.bgPrimaryGreenDark,
      NeoBoButtonDisplayMode.line => NeoColors.bgPrimaryBlackLight,
      NeoBoButtonDisplayMode.textBold => null,
      NeoBoButtonDisplayMode.textRegular => null
    };
  }

  Color _getIconColor(bool buttonEnabled) {
    if (!buttonEnabled) {
      return NeoColors.iconDisabled;
    }
    if (displayMode == NeoBoButtonDisplayMode.primary) {
      return NeoColors.iconPrimaryGreen;
    }
    return NeoColors.iconDefault;
  }

  Border? _getBorder(bool buttonEnabled) {
    if (displayMode == NeoBoButtonDisplayMode.line) {
      return Border.all(
        color: buttonEnabled ? NeoColors.borderDarker : NeoColors.borderDisabled,
        width: _Constants.borderWidth,
      );
    }

    return null;
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
      NeoBoButtonSize.xSmall => NeoTextStyles.bodyElevenSemibold.apply(color: color),
      NeoBoButtonSize.small => baseStyle.apply(color: color),
      NeoBoButtonSize.medium => baseStyle.apply(color: color),
      NeoBoButtonSize.large => NeoTextStyles.labelSixteenSemibold.apply(color: color)
    };
  }

  bool _isButtonEnabled(NeoBoButtonState state) => state.enableState == NeoBoButtonEnableState.enabled || state.enableState == NeoBoButtonEnableState.enabledWithoutOnClick;
}
