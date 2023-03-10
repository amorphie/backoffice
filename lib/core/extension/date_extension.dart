//import 'package:on_multi/app/_.dart';
//import 'package:jiffy/jiffy.dart';
//
//extension DateTimeExtension on DateTime {
//  String get requestFormat {
//    DateFormat f = DateFormat("yyyy/MM/dd");
//
//    return f.format(this);
//  }
//
//  String get showDateTime {
//    DateFormat f = DateFormat("dd/MM/yyyy hh:mm");
//
//    return f.format(this);
//  }
//
//  String get showTime {
//    DateFormat f = DateFormat("hh:mm");
//
//    return f.format(this);
//  }
//
//  String get showTimeUtc {
//    DateTime now = DateTime.now();
//    DateFormat f = DateFormat("HH:mm");
//
//    return f.format(add(now.timeZoneOffset));
//  }
//
//  String get showMS {
//    DateFormat f = DateFormat("mm:ss");
//
//    return f.format(this);
//  }
//
//  String get showDate {
//    DateFormat f = DateFormat("dd/MM/yyyy");
//
//    return f.format(this);
//  }
//
//  String get showDateMonthName {
//    DateFormat f = DateFormat("MMMM", "en");
//
//    return f.format(this);
//  }
//
//  String showDateMonthNameLocale(String locale) {
//    DateFormat f = DateFormat("MMMM", locale);
//
//    return f.format(this);
//  }
//
//  String showYearAndDateMonthNameLocale(String locale) {
//    DateFormat f = DateFormat("yyyy MMMM", locale);
//
//    return f.format(this);
//  }
//
//  DateTime monthAgo(int month) {
//    DateTime now = DateTime.now();
//    DateTime d = Jiffy(DateTime(now.year, now.month, now.day)).subtract(months: month).dateTime;
//    return d;
//  }
//
//  DateTime monthLater(int month) {
//    DateTime now = DateTime.now();
//    DateTime d = Jiffy(DateTime(now.year, now.month, now.day)).add(months: month).dateTime;
//    return d;
//  }
//}
//