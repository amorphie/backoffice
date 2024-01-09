import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/register/widgets/set_password_bullet_view/set_password_bullet_view.dart';

part 'set_password_bullet_view_builder.g.dart';

// STOPSHIP: Delete this ignore
// ignore_for_file: deprecated_member_use_from_same_package
@JsonWidget(type: 'set_password_bullet_view')
abstract class _SetPasswordBulletViewBuilder extends JsonWidgetBuilder {
  const _SetPasswordBulletViewBuilder({
    required super.args,
  });

  @override
  SetPasswordBulletView buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
