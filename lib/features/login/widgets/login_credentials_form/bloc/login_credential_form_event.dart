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

sealed class LoginCredentialFormEvent extends Equatable {
  const LoginCredentialFormEvent();
}

class LoginCredentialFormEventInitialize extends LoginCredentialFormEvent {
  final int? passwordMaxLength;

  const LoginCredentialFormEventInitialize({required this.passwordMaxLength});

  @override
  List<Object?> get props => [];
}

class LoginCredentialFormEventShowNewUserForm extends LoginCredentialFormEvent {
  const LoginCredentialFormEventShowNewUserForm();

  @override
  List<Object?> get props => [];
}

class LoginCredentialFormEventShowExistingUserForm extends LoginCredentialFormEvent {
  const LoginCredentialFormEventShowExistingUserForm();

  @override
  List<Object?> get props => [];
}

class LoginCredentialFormEventToggleActionStatus extends LoginCredentialFormEvent {
  final bool disabled;
  const LoginCredentialFormEventToggleActionStatus({required this.disabled});

  @override
  List<Object?> get props => [disabled];
}
