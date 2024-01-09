part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashEventInitProject extends SplashEvent {
  @override
  List<Object?> get props => [];
}
