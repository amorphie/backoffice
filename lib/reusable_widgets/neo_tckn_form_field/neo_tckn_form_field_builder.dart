/*
 * 
 * neo_bank
 * 
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_tckn_form_field/neo_tckn_form_field.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';

part 'neo_tckn_form_field_builder.g.dart';

abstract class _Constants {
  static const validationsKey = 'validations';
}

@JsonWidget(type: 'neo_tckn_form_field')
abstract class _NeoTcknFormFieldBuilder extends JsonWidgetBuilder {
  const _NeoTcknFormFieldBuilder({required super.args});

  @JsonArgDecoder(_Constants.validationsKey)
  List<NeoTextValidationModel>? _decodeValidations({required JsonWidgetData data}) {
    final listJson = data.jsonWidgetArgs[_Constants.validationsKey];
    return listJson != null ? List<Map<String, dynamic>>.from(listJson).map(NeoTextValidationModel.fromJson).toList() : null;
  }

  @override
  NeoTcknFormField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
