import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/demo_features/demo_saving_accounts_flow_third/widgets/animated_icon.dart';

part 'animated_icon_builder.g.dart';

@JsonWidget(type: 'animated_icon')
abstract class _AnimatedIconBuilder extends JsonWidgetBuilder {
  const _AnimatedIconBuilder({
    required super.args,
  });

  @override
  AnimatedIconExample buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
