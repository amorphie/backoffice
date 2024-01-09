import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/demo_features/widgets/checking/demo_checking_network_dropdown_field.dart';

part 'demo_checking_network_dropdown_field_builder.g.dart';

@JsonWidget(type: 'demo_checking_account_network_dropdown_form_field')
abstract class _DemoCheckingNetworkDropdownFieldBuilder extends JsonWidgetBuilder {
  const _DemoCheckingNetworkDropdownFieldBuilder({required super.args});

  @override
  DemoCheckingNetworkDropdownField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
