import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/localizable_text.dart';
import 'package:backoffice/features/register/widgets/set_password_bullet_view/bloc/set_password_bullet_view_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/constants/neo_constants.dart';
import 'package:backoffice/util/extensions/widget_extensions.dart';
import 'package:backoffice/util/neo_assets.dart';

abstract class _Constants {
  static const double dotSize = 6;
  static const int itemMaxLines = 3;
}

class SetPasswordBulletView extends StatelessWidget {
  final EdgeInsetsDirectional? padding;
  final String passwordWidgetEventKey;
  final String repeatedPasswordWidgetEventKey;

  const SetPasswordBulletView({
    required this.passwordWidgetEventKey,
    required this.repeatedPasswordWidgetEventKey,
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetPasswordBulletViewBloc(
        eventBusPasswordInputKey: passwordWidgetEventKey,
        eventBusRepeatedPasswordInputKey: repeatedPasswordWidgetEventKey,
      ),
      child: BlocBuilder<SetPasswordBulletViewBloc, SetPasswordBulletViewState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildBulletItemRow(
                bulletText: const LocalizableText(
                  tr: "Şifreniz 6 karakter olmalıdır.",
                  en: "Your password must be 6 characters.",
                  ar: "يجب أن تتكون كلمة المرور الخاصة بك من 6 أحرف.",
                ).localize(),
                bulletStatus: state.isCharacterCountMatch,
              ),
              _buildBulletItemRow(
                bulletText: const LocalizableText(
                  tr: "Şifreniz numerik olmalıdır.",
                  en: "Your password must be numeric.",
                  ar: "كلمة المرور الخاصة بك يجب أن تكون رقمية.",
                ).localize(),
                bulletStatus: state.isPasswordNumerical,
              ),
              _buildBulletItemRow(
                bulletText: const LocalizableText(
                  tr: "Şifreniz ardışık ve tekrar rakamlar içermemelidir.",
                  en: "Your password should not contain consecutive and repeated digits.",
                  ar: "يجب ألا تحتوي كلمة المرور الخاصة بك على أرقام متتالية ومتكررة.",
                ).localize(),
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
            iconUrn: bulletStatus ? NeoAssets.tick01.urn : NeoAssets.cancel01.urn,
            width: NeoDimens.px20,
            color: bulletStatus ? NeoColors.iconSuccess : NeoColors.iconDanger,
          )
        else
          Container(
            width: _Constants.dotSize,
            height: _Constants.dotSize,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: NeoColors.bgDark),
          ).paddingOnly(end: NeoDimens.px4),
        Flexible(
          child: Text(
            bulletText,
            maxLines: _Constants.itemMaxLines,
            style: NeoTextStyles.bodyTwelveMedium.apply(color: NeoColors.textNeutral),
          ),
        ),
      ],
    ).paddingSymmetric(vertical: NeoDimens.px4);
  }
}
