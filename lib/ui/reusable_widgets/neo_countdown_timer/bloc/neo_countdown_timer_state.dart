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

class NeoCountdownTimerState extends Equatable {
  final String? duration;
  final bool isFinished;

  const NeoCountdownTimerState({
    this.duration,
    this.isFinished = false,
  });

  NeoCountdownTimerState copyWith({
    String? duration,
    bool? isFinished,
  }) {
    return NeoCountdownTimerState(
      duration: duration ?? this.duration,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  @override
  List<Object?> get props => [duration, isFinished];
}
