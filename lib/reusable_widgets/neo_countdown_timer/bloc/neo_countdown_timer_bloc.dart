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
import 'package:backoffice/core/core_widgets/neo_session_expiration_listener/util/neo_background_timer.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_formatters.dart';
import 'package:neo_core/neo_core.dart';

part 'neo_countdown_timer_event.dart';
part 'neo_countdown_timer_state.dart';

class NeoCountdownTimerBloc extends Bloc<NeoCountdownTimerEvent, NeoCountdownTimerState> {
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;
  final int _duration;
  late final NeoBackgroundTimer _sessionTimer;

  NeoCountdownTimerBloc({required int duration})
      : _duration = duration,
        super(NeoCountdownTimerState(duration: NeoFormatters.formatCountdownTime(duration))) {
    _init();
    on<NeoCountdownTimerEventStartTimer>(_onStartTimer);
    on<NeoCountdownTimerEventTimerTick>(_onTimerTick);
    on<NeoCountdownTimerEventTimerFinished>(_onTimerFinished);
    on<NeoCountdownTimerEventRestartTimer>(_onRestartTimer);
  }

  void _init() {
    _listenForWidgetEvents();
  }

  void _onStartTimer(NeoCountdownTimerEventStartTimer event, Emitter<NeoCountdownTimerState> emit) {
    _sessionTimer = NeoBackgroundTimer(
      seconds: _duration,
      onFinished: () => add(NeoCountdownTimerEventTimerFinished()),
      onTick: (duration) => add(NeoCountdownTimerEventTimerTick(duration: duration)),
      onResumed: () => _sessionTimer.resume(),
      onPaused: () => _sessionTimer.pause(),
    )..init();
    _sessionTimer.start();
  }

  void _onTimerTick(NeoCountdownTimerEventTimerTick event, Emitter<NeoCountdownTimerState> emit) {
    emit(state.copyWith(duration: NeoFormatters.formatCountdownTime(event.duration)));
  }

  void _onTimerFinished(NeoCountdownTimerEventTimerFinished event, Emitter<NeoCountdownTimerState> emit) {
    _sessionTimer.stop();
    emit(state.copyWith(isFinished: true));
  }

  void _onRestartTimer(NeoCountdownTimerEventRestartTimer event, Emitter<NeoCountdownTimerState> emit) {
    _sessionTimer
      ..stop()
      ..start(durationInSeconds: _duration);
  }

  _listenForWidgetEvents() async {
    _neoWidgetEventSubscription = [
      (NeoWidgetEventKeys.neoCountdownTimerRestartTimer, (_) => add(NeoCountdownTimerEventRestartTimer())),
    ].listenEvents();
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    _sessionTimer.dispose();
    return super.close();
  }
}
