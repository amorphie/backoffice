/*
 * neo_bank
 *
 * Created on 25/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

part 'login_app_bar_event.dart';
part 'login_app_bar_state.dart';

class LoginAppBarBloc extends Bloc<LoginAppBarEvent, LoginAppBarState> {
  late final StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  LoginAppBarBloc() : super(const LoginAppBarStateInitial()) {
    on<LoginAppBarEventInitialize>(_onInitialize);
    on<LoginAppBarEventShowFocusedAppBar>(_onShowFocusedAppBar);
    on<LoginAppBarEventShowDefaultAppBar>(_onShowDefaultAppBar);
    on<LoginAppBarEventToggleActionStatus>(_onToggleActionStatus);
  }

  _onInitialize(LoginAppBarEventInitialize event, Emitter<LoginAppBarState> emit) {
    _listenForWidgetEvents();
  }

  _onShowFocusedAppBar(LoginAppBarEventShowFocusedAppBar event, Emitter<LoginAppBarState> emit) {
    emit(const LoginAppBarStateFocused());
  }

  _onShowDefaultAppBar(LoginAppBarEventShowDefaultAppBar event, Emitter<LoginAppBarState> emit) {
    emit(const LoginAppBarStateInitial());
  }

  _onToggleActionStatus(LoginAppBarEventToggleActionStatus event, Emitter<LoginAppBarState> emit) {
    if (state is LoginAppBarStateFocused) {
      emit(LoginAppBarStateFocused(enableUserInterface: event.isInterfaceEnabled));
    } else if (state is LoginAppBarStateInitial) {
      emit(LoginAppBarStateInitial(enableUserInterface: event.isInterfaceEnabled));
    }
  }

  _listenForWidgetEvents() {
    _neoWidgetEventSubscription = [
      // STOPSHIP: Remove these events, use instead NeoWidgetEventKeys.loginAppBarShowFocusedAppBar.name,
      // NeoWidgetEventKeys.loginAppBarShowUnfocusedAppBar.name
      (NeoWidgetEventKeys.loginTextFieldFocused, (_) => add(const LoginAppBarEventShowFocusedAppBar())),
      (NeoWidgetEventKeys.loginTextFieldUnfocused, (_) => add(const LoginAppBarEventShowDefaultAppBar())),
      (NeoWidgetEventKeys.loginEnableUserInterface, (_) => add(const LoginAppBarEventToggleActionStatus(isInterfaceEnabled: true))),
      (NeoWidgetEventKeys.loginDisableUserInterface, (_) => add(const LoginAppBarEventToggleActionStatus(isInterfaceEnabled: false))),
      (
        NeoWidgetEventKeys.loginDisabledPopupClosed,
        (_) {
          NeoWidgetEventKeys.loginTextFieldUnfocused.sendEvent();
          NeoWidgetEventKeys.neoSwipeButtonStopLoading.sendEvent();
        }
      ),
    ].listenEvents();
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
