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

part of 'neo_countdown_timer_bloc.dart';

sealed class NeoCountdownTimerEvent extends Equatable {
  const NeoCountdownTimerEvent();
}

class NeoCountdownTimerEventStartTimer extends NeoCountdownTimerEvent {
  final int duration;

  const NeoCountdownTimerEventStartTimer({required this.duration});

  @override
  List<Object> get props => [duration];
}

class NeoCountdownTimerEventTimerTick extends NeoCountdownTimerEvent {
  @override
  List<Object?> get props => [];
}

class NeoCountdownTimerEventTimerFinished extends NeoCountdownTimerEvent {
  @override
  List<Object?> get props => [];
}
