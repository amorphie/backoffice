/*
 * neo_bank
 *
 * Created on 22/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/features/login/widgets/login_credentials_form/bloc/login_credential_form_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_tckn_form_field/neo_tckn_form_field.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_button_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_keyboard_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/neo_text_form_field.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class LoginCredentialForm extends StatelessWidget {
  final String tcknDataKey;
  final String tcknLabelText;
  final String? tcknErrorText;
  final List<NeoTextValidationModel>? tcknValidations;
  final String passwordDataKey;
  final String passwordLabelText;
  final NeoButtonDataModel? passwordButtonRight;
  final int? passwordMaxLength;
  final List<NeoTextValidationModel>? passwordValidations;

  final EdgeInsetsDirectional padding;
  const LoginCredentialForm({
    required this.tcknDataKey,
    required this.tcknLabelText,
    required this.passwordDataKey,
    required this.passwordLabelText,
    this.tcknErrorText,
    this.tcknValidations,
    this.passwordButtonRight,
    this.passwordMaxLength,
    this.passwordValidations,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCredentialFormBloc, LoginCredentialFormState>(
      bloc: LoginCredentialFormBloc()..add(LoginCredentialFormEventInitialize(passwordMaxLength: passwordMaxLength)),
      listener: (context, state) {
        if (state is LoginCredentialFormStateExistingUserForm) {
          context.read<WorkflowFormBloc>().add(WorkflowFormEventUpdateTextFormField(key: tcknDataKey, value: state.customerId));
        }
      },
      builder: (context, state) {
        return switch (state) {
          LoginCredentialFormStateNewUserForm _ => _buildNewUserForm(state),
          LoginCredentialFormStateExistingUserForm _ => _buildExistingUserForm(state),
          LoginCredentialFormStateLoading _ => _buildLoadingForm(),
        }
            .padding(padding);
      },
    );
  }

  // STOPSHIP: Use skeletonizer when related library added
  Widget _buildLoadingForm() {
    return const Center(child: CircularProgressIndicator(color: NeoColors.bgPrimaryGreen));
  }

  Widget _buildNewUserForm(LoginCredentialFormStateNewUserForm state) {
    return AbsorbPointer(
      absorbing: state.enableUserInterface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTcknFormField(state.focusNodeTckn, state.enableUserInterface).paddingOnly(bottom: NeoDimens.px16),
          _buildPasswordTextFormField(state.focusNodePassword, state.enableUserInterface),
        ],
      ),
    );
  }

  Widget _buildExistingUserForm(LoginCredentialFormStateExistingUserForm state) {
    return AbsorbPointer(
      absorbing: state.enableUserInterface,
      child: _buildPasswordTextFormField(state.focusNodePassword, state.enableUserInterface),
    );
  }

  Widget _buildTcknFormField(FocusNode focusNode, bool enableUserInterface) {
    _unfocusInputField(enableUserInterface, focusNode);
    return NeoTcknFormField(
      dataKey: tcknDataKey,
      labelText: tcknLabelText,
      errorText: tcknErrorText,
      focusNode: focusNode,
      validations: tcknValidations,
    );
  }

  Widget _buildPasswordTextFormField(FocusNode focusNode, bool enableUserInterface) {
    _unfocusInputField(enableUserInterface, focusNode);
    return NeoTextFormField(
      dataKey: passwordDataKey,
      maxLength: passwordMaxLength,
      labelText: passwordLabelText,
      buttonRight: passwordButtonRight,
      keyboardType: NeoKeyboardType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: true,
      enableInteractiveSelection: false,
      focusNode: focusNode,
      widgetEventKey: NeoWidgetEventKeys.neoTextFormFieldUpdateTextEventKey.name,
      validations: passwordValidations,
    );
  }

  void _unfocusInputField(bool enableUserInterface, FocusNode focusNode) {
    if (enableUserInterface) {
      focusNode.unfocus();
    }
  }
}
