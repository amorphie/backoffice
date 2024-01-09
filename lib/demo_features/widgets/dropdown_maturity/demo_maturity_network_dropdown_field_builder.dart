import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity/demo_maturity_network_dropdown_field.dart';

part 'demo_maturity_network_dropdown_field_builder.g.dart';

@JsonWidget(type: 'demo_maturity_network_dropdown_form_field')
abstract class _DemoMaturityNetworkDropdownFieldBuilder extends JsonWidgetBuilder {
  const _DemoMaturityNetworkDropdownFieldBuilder({required super.args});

  @override
  DemoMaturityNetworkDropdownField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
