/*
 * neo_bank
 *
 * Created on 27/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/localizable_text.dart';
import 'package:backoffice/features/security_question/models/set_security_question_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_type.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/neo_dropdown_form_field.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

abstract class _Constants {
  static const String securityQuestionsKey = "securityQuestions";
}

class SetSecurityQuestionDropdownFormField extends StatelessWidget {
  const SetSecurityQuestionDropdownFormField({
    required this.dataKey,
    this.labelText,
    this.hint,
    this.validationErrorMessage,
    this.bottomSheetTitle,
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  final String dataKey;
  final String? labelText;
  final String? hint;
  final String? validationErrorMessage;
  final String? bottomSheetTitle;
  final EdgeInsetsDirectional padding;

  @override
  Widget build(BuildContext context) {
    return padding == EdgeInsetsDirectional.zero ? _buildComponent(context) : Padding(padding: padding, child: _buildComponent(context));
  }

  NeoDropdownFormField _buildComponent(BuildContext context) {
    return NeoDropdownFormField(
      itemList: _getSecurityQuestionList(context),
      dropdownType: NeoDropdownType.securityQuestion,
      labelText: labelText.orEmpty,
      dataKey: dataKey,
      hint: hint,
      bottomSheetTitle: bottomSheetTitle,
      validationErrorMessage: validationErrorMessage,
    );
  }

  List<NeoDropdownListTileData> _getSecurityQuestionList(BuildContext context) => (context.read<WorkflowFormBloc>().formData[_Constants.securityQuestionsKey] as List)
      .map((e) => SetSecurityQuestionDropdownItemData.fromJson(e))
      .map(
        (e) => NeoDropdownListTileData(
          formData: e.id,
          displayData: LocalizableText(en: e.descriptionEn, tr: e.descriptionTr, ar: "").localize(),
        ),
      )
      .toList();
}