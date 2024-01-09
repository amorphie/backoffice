import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_core/neo_core.dart';

part 'splash_event.dart';
part 'splash_state.dart';

abstract class _Constants {
  static const int loadingTimeInSeconds = 2;
}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashStateLoading()) {
    on<SplashEventInitProject>((event, emit) => _onInitProject(emit));
  }

  _onInitProject(Emitter<SplashState> emit) async {
    emit(SplashStateLoading());
    // Waiting time t = maxOf(loadingTime, initTime);
    try {
      await Future.wait([
        Future.delayed(const Duration(seconds: _Constants.loadingTimeInSeconds)),
        _initProject(emit),
      ]);
      emit(SplashStateSuccess());
    } on NeoException catch (neoException) {
      emit(SplashStateError(neoException.error));
    }
  }

  Future _initProject(Emitter<SplashState> emit) async {
    // TODO: Add init logics here
  }
}
