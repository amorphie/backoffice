import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/count_down_timer/circular_count_down_timer.dart';
import 'package:backoffice/reusable_widgets/count_down_timer/count_down_timer_text_format.dart';
import 'package:backoffice/util/neo_util.dart';

class OtpCountDownTimerWidget extends StatelessWidget {
  static const int _defaultDurationInSec = 120;

  final int? durationInSeconds;

  const OtpCountDownTimerWidget({this.durationInSeconds, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: durationInSeconds ?? _defaultDurationInSec,
      controller: CountDownController(),
      width: 232,
      height: 232,
      ringColor: const Color(0xFFF7F7F7),
      fillColor: const Color(0xFF0069AA),
      strokeWidth: 8.0,
      textStyle: const TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold),
      textFormat: CountdownTimerTextFormat.MM_SS,
      isReverse: true,
      onComplete: () {
        // TODO: Implement timeout logics
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        return Function.apply(defaultFormatterFunction, [duration]);
      },
    ).paddingSymmetric(vertical: 16);
  }
}
