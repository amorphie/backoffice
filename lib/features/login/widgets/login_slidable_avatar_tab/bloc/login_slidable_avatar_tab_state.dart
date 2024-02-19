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

sealed class LoginSlidableAvatarTabState extends Equatable {
  const LoginSlidableAvatarTabState();
}

class LoginSlidableAvatarTabStateLoading extends LoginSlidableAvatarTabState {
  const LoginSlidableAvatarTabStateLoading();

  @override
  List<Object> get props => [];
}

class LoginSlidableAvatarTabStateNewUser extends LoginSlidableAvatarTabState {
  final Color activeTabColor;

  const LoginSlidableAvatarTabStateNewUser({
    required this.activeTabColor,
  });

  @override
  List<Object> get props => [activeTabColor];
}

class LoginSlidableAvatarTabStateExistingUser extends LoginSlidableAvatarTabState {
  final Color activeTabColor;
  final bool isSlidable;

  const LoginSlidableAvatarTabStateExistingUser({
    required this.activeTabColor,
    required this.isSlidable,
  });

  @override
  List<Object> get props => [activeTabColor, isSlidable];
}
