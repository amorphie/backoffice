import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/security_question/widgets/set_security_question_dropdown_form_field.dart';

part 'set_security_question_dropdown_form_field_builder.g.dart';

@JsonWidget(type: 'set_security_question_dropdown_form_field')
abstract class _SetSecurityQuestionDropdownFormFieldBuilder extends JsonWidgetBuilder {
  const _SetSecurityQuestionDropdownFormFieldBuilder({required super.args});

  @override
  SetSecurityQuestionDropdownFormField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
