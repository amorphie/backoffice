import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/demo_features/demo_saving_accounts_flow_two/widgets/custom_neo_transition_button.dart';

part 'custom_neo_transition_button_builder.g.dart';

@JsonWidget(type: 'custom_neo_transition_button')
abstract class _CustomNeoTransitionButtonBuilder extends JsonWidgetBuilder {
  const _CustomNeoTransitionButtonBuilder({
    required super.args,
  });

  @override
  CustomNeoTransitionButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
