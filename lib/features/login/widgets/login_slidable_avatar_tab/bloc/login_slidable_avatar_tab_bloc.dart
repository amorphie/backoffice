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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';
import 'package:neo_core/core/storage/neo_storage.dart';

part 'login_slidable_avatar_tab_event.dart';
part 'login_slidable_avatar_tab_state.dart';

class LoginSlidableAvatarTabBloc extends Bloc<LoginSlidableAvatarTabEvent, LoginSlidableAvatarTabState> {
  late final NeoCoreSecureStorage? _storage;
  late final StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;
  Color activeTabColor = NeoColors.bgPrimaryGreen;

  // STOPSHIP: Change this when burgan_core updated
  Future<bool> get _isUserExist async => !(await _storage?.getCustomerId()).isNullOrBlank;

  LoginSlidableAvatarTabBloc() : super(const LoginSlidableAvatarTabStateLoading()) {
    on<LoginSlidableAvatarTabEventInitialize>(_onInitialize);
    on<LoginSlidableAvatarTabEventShowExistingUser>(_onShowExistingUser);
    on<LoginSlidableAvatarTabEventShowNewUser>(_onShowNewUser);
    on<LoginSlidableAvatarTabEventChangeActiveTabColor>(_onChangeActiveTabColor);
  }

  _onInitialize(event, emit) async {
    _storage = NeoCoreSecureStorage();
    _listenForWidgetEvents();

    if (await _isUserExist) {
      add(const LoginSlidableAvatarTabEventShowExistingUser());
    } else {
      add(const LoginSlidableAvatarTabEventShowNewUser());
    }
  }

  _onShowExistingUser(LoginSlidableAvatarTabEventShowExistingUser event, Emitter<LoginSlidableAvatarTabState> emit) {
    emit(LoginSlidableAvatarTabStateExistingUser(activeTabColor: activeTabColor));
  }

  _onShowNewUser(LoginSlidableAvatarTabEventShowNewUser event, Emitter<LoginSlidableAvatarTabState> emit) {
    emit(LoginSlidableAvatarTabStateNewUser(activeTabColor: activeTabColor));
  }

  _onChangeActiveTabColor(
    LoginSlidableAvatarTabEventChangeActiveTabColor event,
    Emitter<LoginSlidableAvatarTabState> emit,
  ) {
    activeTabColor = event.color;
    emit(
      switch (state) {
        LoginSlidableAvatarTabStateLoading _ => const LoginSlidableAvatarTabStateLoading(),
        LoginSlidableAvatarTabStateNewUser _ => LoginSlidableAvatarTabStateNewUser(activeTabColor: activeTabColor),
        LoginSlidableAvatarTabStateExistingUser _ => LoginSlidableAvatarTabStateExistingUser(activeTabColor: activeTabColor),
      },
    );
  }

  _listenForWidgetEvents() {
    _neoWidgetEventSubscription = [
      (NeoWidgetEventKeys.loginShowNewUserPage, (_) => add(const LoginSlidableAvatarTabEventShowNewUser())),
      (NeoWidgetEventKeys.loginShowExistUserPage, (_) => add(const LoginSlidableAvatarTabEventShowExistingUser())),
      // STOPSHIP: Remove the events below, use instead NeoWidgetEventKeys.loginSlidableAvatarTabChangeActiveTabColor
      (NeoWidgetEventKeys.loginTextFieldFocused, (_) => add(const LoginSlidableAvatarTabEventChangeActiveTabColor(color: NeoColors.bgDarker))),
      (NeoWidgetEventKeys.loginTextFieldUnfocused, (_) => add(const LoginSlidableAvatarTabEventChangeActiveTabColor(color: NeoColors.bgPrimaryGreen))),
    ].listenEvents();
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
