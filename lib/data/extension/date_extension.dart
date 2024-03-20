import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  int get secondsSinceEpoch {
    var ms = this.millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  String get requestFormat {
    DateFormat f = DateFormat("yyyy/MM/dd");

    return f.format(this);
  }

  String get showDateTime {
    DateFormat f = DateFormat("dd/MM/yyyy hh:mm");

    return f.format(this);
  }

  String get showTime {
    DateFormat f = DateFormat("hh:mm");

    return f.format(this);
  }

  String get showTimeUtc {
    DateTime now = DateTime.now();
    DateFormat f = DateFormat("HH:mm");

    return f.format(add(now.timeZoneOffset));
  }

  String get showMS {
    DateFormat f = DateFormat("mm:ss");

    return f.format(this);
  }

  String get showDate {
    DateFormat f = DateFormat("dd/MM/yyyy");

    return f.format(this);
  }

  String get showDateMonthName {
    DateFormat f = DateFormat("MMMM", "en");

    return f.format(this);
  }

  String get toZoneDate =>
      "${toIso8601String().replaceAll("Z", "")}${timeZoneOffset.isNegative ? "-" : "+"}${(timeZoneOffset.inMinutes / 60).floor().toString().padLeft(2, "0")}:${(timeZoneOffset.inMinutes % 60).toString().padLeft(2, "0")}";

  String showDateMonthNameLocale(String locale) {
    DateFormat f = DateFormat("MMMM", locale);

    return f.format(this);
  }

  String showYearAndDateMonthNameLocale(String locale) {
    DateFormat f = DateFormat("yyyy MMMM", locale);

    return f.format(this);
  }
}
