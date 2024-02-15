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

sealed class LoginAppBarState extends Equatable {
  final bool enableUserInterface;

  const LoginAppBarState({this.enableUserInterface = true});
}

class LoginAppBarStateInitial extends LoginAppBarState {
  const LoginAppBarStateInitial({super.enableUserInterface});

  @override
  List<Object> get props => [enableUserInterface];
}

class LoginAppBarStateFocused extends LoginAppBarState {
  const LoginAppBarStateFocused({super.enableUserInterface});

  @override
  List<Object> get props => [enableUserInterface];
}
