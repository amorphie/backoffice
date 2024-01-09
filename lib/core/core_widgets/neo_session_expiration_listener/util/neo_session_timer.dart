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

import 'package:async/async.dart';
import 'package:flutter/material.dart';

abstract class _Constant {
  static const timerDuration = Duration(minutes: 5);
}

class NeoSessionTimer {
  static late VoidCallback onTimeOut;

  static final NeoSessionTimer _instance = NeoSessionTimer._();

  factory NeoSessionTimer() {
    return _instance;
  }

  NeoSessionTimer._();

  late RestartableTimer restartableTimer = RestartableTimer(
    _Constant.timerDuration,
    () {
      cancelTimer();
      onTimeOut();
    },
  );

  static void setTimeOutCallback(VoidCallback onTimeOut) {
    NeoSessionTimer.onTimeOut = onTimeOut;
  }

  void resetTimer() {
    restartableTimer.reset();
  }

  void cancelTimer() {
    restartableTimer.cancel();
  }
}
