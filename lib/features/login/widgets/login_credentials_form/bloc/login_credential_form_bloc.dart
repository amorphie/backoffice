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

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/features/login/widgets/login_credentials_form/usecases/unlink_customer_from_device_usecase.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/storage/neo_core_secure_storage.dart';

part 'login_credential_form_event.dart';
part 'login_credential_form_state.dart';

class LoginCredentialFormBloc extends Bloc<LoginCredentialFormEvent, LoginCredentialFormState> {
  late final FocusNode _focusNodePassword;
  late final FocusNode _focusNodeTckn;
  late final StreamSubscription<NeoWidgetEvent>? neoWidgetEventSubscription;
  late final NeoCoreSecureStorage? _storage;
  late int? _passwordMaxLength;
  bool isButtonSwipedOnce = false;

  LoginCredentialFormBloc() : super(LoginCredentialFormStateLoading()) {
    on<LoginCredentialFormEventInitialize>(_onInitialize);
    on<LoginCredentialFormEventShowNewUserForm>(_onShowNewUserForm);
    on<LoginCredentialFormEventShowExistingUserForm>(_onShowExistingUserForm);
    on<LoginCredentialFormEventToggleActionStatus>(_onToggleActionStatus);
  }

  Future<String> get _getCustomerId async => await _storage?.getCustomerId() ?? "";

  Future<bool> get _isUserExist async => !(await _getCustomerId).isBlank;

  _onInitialize(LoginCredentialFormEventInitialize event, Emitter<LoginCredentialFormState> emit) async {
    _storage = NeoCoreSecureStorage();
    _focusNodePassword = FocusNode();
    _focusNodeTckn = FocusNode();
    _passwordMaxLength = event.passwordMaxLength;

    _listenFocusNodes();
    _listenForWidgetEvents();

    if (await _isUserExist) {
      emit(
        LoginCredentialFormStateExistingUserForm(
          focusNodePassword: _focusNodePassword,
          enableUserInterface: false,
          customerId: await _getCustomerId,
        ),
      );
    } else {
      emit(
        LoginCredentialFormStateNewUserForm(
          focusNodeTckn: _focusNodeTckn,
          focusNodePassword: _focusNodePassword,
          enableUserInterface: false,
        ),
      );
    }
  }

  _onShowNewUserForm(LoginCredentialFormEventShowNewUserForm event, Emitter<LoginCredentialFormState> emit) {
    emit(
      LoginCredentialFormStateNewUserForm(
        focusNodeTckn: _focusNodeTckn,
        focusNodePassword: _focusNodePassword,
        enableUserInterface: false,
      ),
    );
  }

  _onShowExistingUserForm(
    LoginCredentialFormEventShowExistingUserForm event,
    Emitter<LoginCredentialFormState> emit,
  ) async {
    emit(
      LoginCredentialFormStateExistingUserForm(
        customerId: await _getCustomerId,
        focusNodePassword: _focusNodePassword,
        enableUserInterface: false,
      ),
    );
  }

  _onToggleActionStatus(
    LoginCredentialFormEventToggleActionStatus event,
    Emitter<LoginCredentialFormState> emit,
  ) async {
    final currentState = state;
    if (currentState is LoginCredentialFormStateExistingUserForm) {
      emit(
        LoginCredentialFormStateExistingUserForm(
          customerId: currentState.customerId,
          focusNodePassword: _focusNodePassword,
          enableUserInterface: event.disabled,
        ),
      );
    } else if (currentState is LoginCredentialFormStateNewUserForm) {
      emit(
        LoginCredentialFormStateNewUserForm(
          focusNodeTckn: _focusNodeTckn,
          focusNodePassword: _focusNodePassword,
          enableUserInterface: event.disabled,
        ),
      );
    }
  }

  _listenFocusNodes() {
    _focusNodePassword.addListener(() {
      if (_focusNodePassword.hasFocus) {
        NeoWidgetEventKeys.loginTextFieldFocused.sendEvent();
      }
    });

    _focusNodeTckn.addListener(() {
      if (_focusNodeTckn.hasFocus) {
        NeoWidgetEventKeys.loginTextFieldFocused.sendEvent();
      }
    });
  }

  _listenForWidgetEvents() async {
    neoWidgetEventSubscription = [
      (
        NeoWidgetEventKeys.loginShowNewUserPage,
        (_) {
          _unlinkCustomerFromDevice();
          add(const LoginCredentialFormEventShowNewUserForm());
        }
      ),
      (NeoWidgetEventKeys.loginShowExistUserPage, (_) => add(const LoginCredentialFormEventShowExistingUserForm())),
      (NeoWidgetEventKeys.loginEnableUserInterface, (_) => add(const LoginCredentialFormEventToggleActionStatus(disabled: false))),
      (NeoWidgetEventKeys.loginDisableUserInterface, (_) => add(const LoginCredentialFormEventToggleActionStatus(disabled: true))),
      (
        NeoWidgetEventKeys.neoTextFormFieldUpdateTextEventKey,
        (event) {
          final data = event.data;
          if (data is String) {
            if (!isButtonSwipedOnce && data.length == _passwordMaxLength) {
              NeoWidgetEventKeys.neoSwipeButtonStartTransaction.sendEvent();
              isButtonSwipedOnce = true;
            }
          }
        }
      ),
    ].listenEvents();
  }

  Future<void> _unlinkCustomerFromDevice() async {
    // STOPSHIP: Delete customer profile image
    await UnlinkCustomerFromDeviceUseCase().call();
    unawaited(NeoCoreSecureStorage().deleteCustomer());
  }

  @override
  Future<void> close() {
    _focusNodePassword.dispose();
    neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
