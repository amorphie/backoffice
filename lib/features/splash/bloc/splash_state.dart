part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();
}

class SplashStateLoading extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashStateSuccess extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashStateError extends SplashState {
  final NeoError error;

  const SplashStateError(this.error);

  @override
  List<Object> get props => [error];
}
