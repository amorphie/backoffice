import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_button_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_keyboard_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/neo_text_form_field.dart';

part 'neo_text_form_field_builder.g.dart';

@JsonWidget(type: 'neo_text_form_field')
abstract class _NeoTextFormFieldBuilder extends JsonWidgetBuilder {
  const _NeoTextFormFieldBuilder({
    required super.args,
  });

  @override
  NeoTextFormField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
