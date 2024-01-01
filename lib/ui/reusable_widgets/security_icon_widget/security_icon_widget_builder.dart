import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:admin/ui/reusable_widgets/security_icon_widget/security_icon_widget.dart';

part 'security_icon_widget_builder.g.dart';

@JsonWidget(type: 'security_icon_widget')
abstract class _SecurityIconWidgetBuilder extends JsonWidgetBuilder {
  const _SecurityIconWidgetBuilder({
    required super.args,
  });

  @override
  SecurityIconWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
