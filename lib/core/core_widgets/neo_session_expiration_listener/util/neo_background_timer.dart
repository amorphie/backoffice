/*
 * neo_bank
 *
 * Created on 2/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:async';

import 'package:flutter/material.dart';

abstract class _Constant {
  static const timerPeriod = Duration(seconds: 1);
}

class _TimerDifferenceHandler {
  static late DateTime endingTime;

  static final _TimerDifferenceHandler _instance = _TimerDifferenceHandler();

  static _TimerDifferenceHandler get instance => _instance;

  int get remainingSeconds {
    final DateTime dateTimeNow = DateTime.now();
    final Duration remainingTime = endingTime.difference(dateTimeNow);
    return remainingTime.inSeconds;
  }

  void setEndingTime(int durationToEnd) {
    final DateTime dateTimeNow = DateTime.now();
    // Ending time is the current time plus the remaining duration.
    endingTime = dateTimeNow.add(
      Duration(
        seconds: durationToEnd,
      ),
    );
  }
}

class NeoBackgroundTimer with WidgetsBindingObserver {
  int _countdownSeconds;
  bool _onPausedCalled = false;
  Timer? _timer;
  final _timerHandler = _TimerDifferenceHandler.instance;
  final VoidCallback? _onFinished;
  final VoidCallback? _onResumed;
  final VoidCallback? _onPaused;
  final Function(int)? _onTick;

  NeoBackgroundTimer({
    required int seconds,
    Function(int)? onTick,
    VoidCallback? onFinished,
    VoidCallback? onResumed,
    VoidCallback? onPaused,
  })  : _countdownSeconds = seconds,
        _onTick = onTick,
        _onFinished = onFinished,
        _onResumed = onResumed,
        _onPaused = onPaused;

  void init() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _onResumed?.call();
    } else if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _onPaused?.call();
    }
  }

  void start({int? durationInSeconds}) {
    if (durationInSeconds != null) {
      _countdownSeconds = durationInSeconds;
    }
    _timerHandler.setEndingTime(_countdownSeconds); //setting end time
    _timer?.cancel();
    _timer = Timer.periodic(_Constant.timerPeriod, (timer) {
      _countdownSeconds--;
      if (_onTick != null) {
        _onTick(_countdownSeconds);
      }

      if (_countdownSeconds <= 0) {
        stop();
        if (_onFinished != null) {
          _onFinished();
        }
      }
    });
  }

  void pause() {
    _onPausedCalled = true;
    stop();
  }

  void resume() {
    if (!_onPausedCalled) {
      //if on pause not called, instead resumed will called directly.. so no need to do any operations
      return;
    }
    if (_timerHandler.remainingSeconds > 0) {
      _countdownSeconds = _timerHandler.remainingSeconds;
      start();
    } else {
      stop();
      if (_onFinished != null) {
        _onFinished();
      }
      if (_onTick != null) {
        _onTick(_countdownSeconds); //callback
      }
    }
    _onPausedCalled = false;
  }

  void stop() {
    if (_timer == null) {
      return;
    }
    _timer?.cancel();
    _countdownSeconds = 0;
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    stop();
  }
}
