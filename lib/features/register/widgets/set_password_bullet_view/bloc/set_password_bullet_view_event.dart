part of 'set_password_bullet_view_bloc.dart';

sealed class SetPasswordBulletViewEvent extends Equatable {
  const SetPasswordBulletViewEvent();
}

class SetPasswordBulletViewEventChangeInput extends SetPasswordBulletViewEvent {
  const SetPasswordBulletViewEventChangeInput();

  @override
  List<Object?> get props => [];
}

class SetPasswordBulletViewEventFetchOldPasswords extends SetPasswordBulletViewEvent {
  const SetPasswordBulletViewEventFetchOldPasswords();
  @override
  List<Object?> get props => [];
}
