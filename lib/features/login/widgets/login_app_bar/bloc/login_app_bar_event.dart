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

part of 'login_app_bar_bloc.dart';

sealed class LoginAppBarEvent extends Equatable {
  const LoginAppBarEvent();
}

class LoginAppBarEventInitialize extends LoginAppBarEvent {
  const LoginAppBarEventInitialize();
  @override
  List<Object?> get props => [];
}

class LoginAppBarEventShowFocusedAppBar extends LoginAppBarEvent {
  const LoginAppBarEventShowFocusedAppBar();
  @override
  List<Object?> get props => [];
}

class LoginAppBarEventShowDefaultAppBar extends LoginAppBarEvent {
  const LoginAppBarEventShowDefaultAppBar();
  @override
  List<Object?> get props => [];
}

class LoginAppBarEventToggleActionStatus extends LoginAppBarEvent {
  final bool isInterfaceEnabled;

  const LoginAppBarEventToggleActionStatus({required this.isInterfaceEnabled});

  @override
  List<Object?> get props => [isInterfaceEnabled];
}
