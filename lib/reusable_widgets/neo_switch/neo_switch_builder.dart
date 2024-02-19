import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_switch/neo_switch.dart';

part 'neo_switch_builder.g.dart';

@JsonWidget(type: 'neo_switch')
abstract class _NeoSwitchBuilder extends JsonWidgetBuilder {
  const _NeoSwitchBuilder({required super.args});

  @override
  NeoSwitch buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
