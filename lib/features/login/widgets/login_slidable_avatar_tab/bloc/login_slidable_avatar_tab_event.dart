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

part of 'login_slidable_avatar_tab_bloc.dart';

sealed class LoginSlidableAvatarTabEvent extends Equatable {
  const LoginSlidableAvatarTabEvent();
}

class LoginSlidableAvatarTabEventInitialize extends LoginSlidableAvatarTabEvent {
  const LoginSlidableAvatarTabEventInitialize();

  @override
  List<Object?> get props => [];
}

class LoginSlidableAvatarTabEventShowNewUser extends LoginSlidableAvatarTabEvent {
  const LoginSlidableAvatarTabEventShowNewUser();

  @override
  List<Object?> get props => [];
}

class LoginSlidableAvatarTabEventShowExistingUser extends LoginSlidableAvatarTabEvent {
  const LoginSlidableAvatarTabEventShowExistingUser();

  @override
  List<Object?> get props => [];
}

class LoginSlidableAvatarTabEventChangeActiveTabColor extends LoginSlidableAvatarTabEvent {
  final Color color;

  const LoginSlidableAvatarTabEventChangeActiveTabColor({
    required this.color,
  });

  @override
  List<Object?> get props => [color];
}
