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

part of 'login_credential_form_bloc.dart';

sealed class LoginCredentialFormState extends Equatable {
  const LoginCredentialFormState();
}

class LoginCredentialFormStateLoading extends LoginCredentialFormState {
  @override
  List<Object> get props => [];
}

class LoginCredentialFormStateNewUserForm extends LoginCredentialFormState {
  final FocusNode focusNodeTckn;
  final FocusNode focusNodePassword;
  final bool enableUserInterface;

  const LoginCredentialFormStateNewUserForm({
    required this.focusNodeTckn,
    required this.focusNodePassword,
    required this.enableUserInterface,
  });

  @override
  List<Object> get props => [focusNodeTckn, focusNodePassword, enableUserInterface];
}

class LoginCredentialFormStateExistingUserForm extends LoginCredentialFormState {
  final String customerId;
  final FocusNode focusNodePassword;
  final bool enableUserInterface;

  const LoginCredentialFormStateExistingUserForm({
    required this.customerId,
    required this.focusNodePassword,
    required this.enableUserInterface,
  });

  @override
  List<Object> get props => [customerId, focusNodePassword, enableUserInterface];
}
