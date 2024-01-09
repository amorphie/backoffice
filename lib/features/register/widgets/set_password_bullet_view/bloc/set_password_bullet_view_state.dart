part of 'set_password_bullet_view_bloc.dart';

class SetPasswordBulletViewState extends Equatable {
  const SetPasswordBulletViewState({
    this.isCharacterCountMatch,
    this.isPasswordNumerical,
    this.isNotConsecutiveAndRepeated,
  });

  final bool? isCharacterCountMatch;
  final bool? isPasswordNumerical;
  final bool? isNotConsecutiveAndRepeated;

  @override
  List<Object?> get props => [isCharacterCountMatch, isPasswordNumerical, isNotConsecutiveAndRepeated];
}
