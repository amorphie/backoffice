/*
 * 
 * Neobank.Client
 * 
 * Created on 15/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/util/neo_formatters.dart';

part 'neo_countdown_timer_event.dart';
part 'neo_countdown_timer_state.dart';

class NeoCountdownTimerBloc extends Bloc<NeoCountdownTimerEvent, NeoCountdownTimerState> {
  int _duration;

  NeoCountdownTimerBloc({required int duration})
      : _duration = duration,
        super(NeoCountdownTimerState(duration: NeoFormatters.formatCountdownTime(duration))) {
    on<NeoCountdownTimerEventStartTimer>(_onStartTimer);
    on<NeoCountdownTimerEventTimerTick>(_onTimerTick);
    on<NeoCountdownTimerEventTimerFinished>(_onTimerFinished);
  }

  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void _onStartTimer(NeoCountdownTimerEventStartTimer event, Emitter<NeoCountdownTimerState> emit) {
    _duration = event.duration;
    _startTimer();
  }

  void _onTimerTick(NeoCountdownTimerEventTimerTick event, Emitter<NeoCountdownTimerState> emit) {
    emit(state.copyWith(duration: NeoFormatters.formatCountdownTime(_duration)));
  }

  void _onTimerFinished(NeoCountdownTimerEventTimerFinished event, Emitter<NeoCountdownTimerState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isFinished: true, duration: NeoFormatters.formatCountdownTime(_duration)));
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        _cancelTimer();
        return;
      }

      if (_duration > 0) {
        _duration--;
        if (_duration == 0) {
          _cancelTimer();
        } else {
          add(NeoCountdownTimerEventTimerTick());
        }
      } else {
        _cancelTimer();
      }
    });
  }

  void _cancelTimer() {
    add(NeoCountdownTimerEventTimerFinished());
    _timer?.cancel();
  }
}
