import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/demo_features/demo_accounts_second/widgets/branch_code_dropdown_field/neo_network_dropdown_form_field.dart';

part 'neo_network_dropdown_form_field_builder2.g.dart';

// STOPSHIP: Move to neo_ui package
@JsonWidget(type: 'neo_network_dropdown_form_field2')
abstract class _NeoNetworkDropdownFormFieldBuilder2 extends JsonWidgetBuilder {
  const _NeoNetworkDropdownFormFieldBuilder2({
    required super.args,
  });

  @override
  NeoNetworkDropdownFormField2 buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
