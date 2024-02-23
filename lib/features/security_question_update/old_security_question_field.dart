/*
 * neo_bank
 *
 * Created on 20/02/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/features/security_question_update/bloc/old_security_question_field_bloc.dart';
import 'package:backoffice/features/security_question_update/network/old_security_question_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/neo_text_form_field.dart';
import 'package:backoffice/util/extensions/widget_extensions.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class _Constants {
  static const String oldAnswerDataKey = "oldAnswer";
  static const String oldAnswerFieldValidateRegex = '^(?!\$)';
}

class OldSecurityQuestionField extends StatelessWidget {
  final EdgeInsetsDirectional padding;

  const OldSecurityQuestionField({this.padding = EdgeInsetsDirectional.zero, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OldSecurityQuestionFieldBloc(
        networkManager: OldSecurityQuestionNetworkManager(),
      )..add(const OldSecurityQuestionFetchQuestion()),
      child: BlocBuilder<OldSecurityQuestionFieldBloc, OldSecurityQuestionFieldState>(
        builder: (context, state) {
          return _buildComponent(context, state).padding(padding);
        },
      ),
    );
  }

  Widget _buildComponent(BuildContext context, OldSecurityQuestionFieldState state) {
    return Skeletonizer(
      enabled: state is OldSecurityQuestionFieldStateLoading,
      child: _buildQuestionField(context, state),
    );
  }

  //TODO: Handle other states if necessary
  Widget _buildQuestionField(BuildContext context, OldSecurityQuestionFieldState state) {
    switch (state) {
      case OldSecurityQuestionFieldStateLoaded _:
        return NeoTextFormField(
          dataKey: _Constants.oldAnswerDataKey,
          titleText: state.oldSecurityQuestion.question ?? '',
          validations: [
            NeoTextValidationModel(
              regex: _Constants.oldAnswerFieldValidateRegex,
              message: LocalizationKey.profileAndSettingsSecurityQuestionMissingAnswerErrorMessage.loc(),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
