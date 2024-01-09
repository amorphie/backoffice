import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity_renewal/demo_maturity_renewal_network_dropdown_field.dart';

part 'demo_maturity_renewal_network_dropdown_field_builder.g.dart';

@JsonWidget(type: 'demo_maturity_renewal_network_dropdown_form_field')
abstract class _DemoMaturityRenewalNetworkDropdownFieldBuilder extends JsonWidgetBuilder {
  const _DemoMaturityRenewalNetworkDropdownFieldBuilder({required super.args});

  @override
  DemoMaturiytRenewalNetworkDropdownField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
