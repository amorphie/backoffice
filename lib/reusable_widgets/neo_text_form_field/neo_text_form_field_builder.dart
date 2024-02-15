import 'package:collection/collection.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_button_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_keyboard_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_input_formatter_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/neo_text_form_field.dart';

part 'neo_text_form_field_builder.g.dart';

abstract class _Constants {
  static const validationsKey = 'validations';
  static const inputFormattersKey = 'inputFormatters';
}

@JsonWidget(type: 'neo_text_form_field')
abstract class _NeoTextFormFieldBuilder extends JsonWidgetBuilder {
  const _NeoTextFormFieldBuilder({
    required super.args,
  });

  @JsonArgDecoder(_Constants.validationsKey)
  List<NeoTextValidationModel>? _decodeValidations({required JsonWidgetData data}) {
    final listJson = data.jsonWidgetArgs[_Constants.validationsKey];
    return listJson != null ? List<Map<String, dynamic>>.from(listJson).map(NeoTextValidationModel.fromJson).toList() : null;
  }

  @JsonArgDecoder(_Constants.inputFormattersKey)
  List<TextInputFormatter>? _decodeInputFormatters({required JsonWidgetData data}) {
    final listJson = data.jsonWidgetArgs[_Constants.inputFormattersKey];
    final inputFormatterList = listJson != null ? List<Map<String, dynamic>>.from(listJson).map(NeoTextInputFormatterModel.fromJson).toList() : null;
    return inputFormatterList?.map<TextInputFormatter?>((e) => e.regex != null ? FilteringTextInputFormatter.allow(RegExp(e.regex!)) : null).whereNotNull().toList();
  }

  @override
  NeoTextFormField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
