import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/login_attempt_list_item_widget/login_attempt_list_item_widget.dart';

part 'login_attempt_list_item_widget_builder.g.dart';

@JsonWidget(type: 'login_attempt_list_item')
abstract class _LoginAttemptListItemWidgetBuilder extends JsonWidgetBuilder {
  const _LoginAttemptListItemWidgetBuilder({
    required super.args,
  });

  @override
  LoginAttemptListItemWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
