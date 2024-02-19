import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/features/register/widgets/set_password_bullet_view/bloc/set_password_bullet_view_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_constants.dart';
import 'package:backoffice/util/extensions/widget_extensions.dart';
import 'package:backoffice/util/neo_assets.dart';

abstract class _Constants {
  static const double dotSize = 6;
  static const int itemMaxLines = 3;
  static const int loginPasswordLength = 6;
  static const int debitCardPinLength = 4;
}

class SetPasswordBulletView extends StatelessWidget {
  final EdgeInsetsDirectional? padding;
  final String passwordWidgetEventKey;
  final String repeatedPasswordWidgetEventKey;
  final int passwordLength;

  const SetPasswordBulletView({
    required this.passwordWidgetEventKey,
    required this.repeatedPasswordWidgetEventKey,
    required this.passwordLength,
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetPasswordBulletViewBloc(
        eventBusPasswordInputKey: passwordWidgetEventKey,
        eventBusRepeatedPasswordInputKey: repeatedPasswordWidgetEventKey,
        passwordLength: passwordLength,
      ),
      child: BlocBuilder<SetPasswordBulletViewBloc, SetPasswordBulletViewState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildBulletItemRow(
                bulletText: getBulletTextForCharLengthRule(passwordLength),
                bulletStatus: state.isCharacterCountMatch,
              ),
              _buildBulletItemRow(
                bulletText: LocalizationKey.loginNewPasswordRule2Text.loc(),
                bulletStatus: state.isPasswordNumerical,
              ),
              _buildBulletItemRow(
                bulletText: LocalizationKey.loginNewPasswordRule3Text.loc(),
                bulletStatus: state.isNotConsecutiveAndRepeated,
              ),
            ],
          ).padding(padding ?? EdgeInsetsDirectional.zero);
        },
      ),
    );
  }

  Widget _buildBulletItemRow({required String bulletText, bool? bulletStatus}) {
    return Row(
      children: [
        if (bulletStatus != null)
          NeoIcon(
            iconUrn: bulletStatus ? NeoAssets.check20px.urn : NeoAssets.close20px.urn,
            color: bulletStatus ? NeoColors.iconSuccess : NeoColors.iconDanger,
          )
        else
          Container(
            width: _Constants.dotSize,
            height: _Constants.dotSize,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: NeoColors.bgDarker),
          ).paddingOnly(end: NeoDimens.px8),
        Flexible(
          child: NeoText(
            bulletText,
            maxLines: _Constants.itemMaxLines,
            style: NeoTextStyles.bodyTwelveMedium,
          ),
        ),
      ],
    ).paddingSymmetric(vertical: NeoDimens.px4);
  }

  String getBulletTextForCharLengthRule(int passwordLength) {
    switch (passwordLength) {
      case _Constants.loginPasswordLength:
        return LocalizationKey.loginNewPasswordRule1Text.loc();
      case _Constants.debitCardPinLength:
        return LocalizationKey.debitCardSettingsPinChangeCharacterText.loc();
      default:
        return LocalizationKey.loginNewPasswordRule1Text.loc();
    }
  }
}
