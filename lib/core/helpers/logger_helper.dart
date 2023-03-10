// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'dart:convert';

import 'package:logger/logger.dart';

Logger appLogger = Logger(printer: EtoPrinter(printTime: false));
Logger chatLogger = Logger(printer: EtoPrinter(printTime: false, chat: true, printEmojis: false));

const bool printDebug = true;
printTime() {
  Logger().wtf(DateTime.now().toIso8601String());
}

buttonLog(String text, String widget) {
  appLogger.wtf("$text onPressed", widget, StackTrace.empty);
}

printLog(
  dynamic data, {
  bool isError = false,
  bool isInfo = false,
  bool isWarning = false,
  bool isSuccess = false,
  bool isResponse = false,
  bool isRequest = false,
}) {
  Logger logger = Logger(printer: EtoPrinter());
  if (printDebug) {
    if (isError) {
      logger.e(data);
    } else if (isInfo) {
      logger.i(data);
    } else if (isWarning) {
      logger.w(data);
    } else if (isSuccess) {
      logger.d(data);
    } else if (isResponse) {
      logger.v(data);
    } else if (isRequest) {
      logger.v(data);
    } else {
      logger.wtf(data, null, StackTrace.empty);
    }
  }
}

class EtoPrinter extends LogPrinter {
  final bool chat;
  static const topLeftCorner = '┌';
  static const bottomLeftCorner = '└';
  static const middleCorner = '├';
  static const verticalLine = '│';
  static const doubleDivider = '─';
  static const singleDivider = '┄';
  static bool _isChat = false;
  static Map<Level, AnsiColor> get levelColors => {
        Level.verbose: AnsiColor.fg(_isChat ? 228 : 46),
        Level.debug: AnsiColor.fg(_isChat ? 111 : 226),
        Level.info: AnsiColor.fg(_isChat ? 50 : 20),
        Level.warning: AnsiColor.fg(_isChat ? 148 : 208),
        Level.error: AnsiColor.fg(_isChat ? 188 : 196),
        Level.wtf: AnsiColor.fg(_isChat ? 93 : 199),
      };
//👌😎🐼😂 "😍🌹♥️❤️🥳🇹🇷✅🐴🤮💋💔💯💥💣🖕👍🗣️🍉🍆✈️🌝🌪️⚡🔥🌈🎃🎱🧿🏆🔔🎵🎶🎹🎸🎺🚽🩹☢️☣️🚸⛔🚫⚠️🚼🚾🛐💲©️®️™️✔️❌☑️✅❎⭕♻️⚧♂️♀️🆘🏁🚩🏳️🏴"

  static final levelEmojis = {
    Level.verbose: '✅',
    Level.debug: '⭕',
    Level.info: '😎 ',
    Level.warning: '🖕',
    Level.error: '💣 ',
    Level.wtf: '💔',
  };

  // /// Matches a stacktrace line as generated on Android/iOS devices.
  // /// For example:
  // /// #1      Logger.log (package:logger/src/logger.dart:115:29)
  // static final _deviceStackTraceRegex =
  //     RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  // /// Matches a stacktrace line as generated by Flutter web.
  // /// For example:
  // /// packages/logger/src/printers/pretty_printer.dart 91:37
  // static final _webStackTraceRegex =
  //     RegExp(r'^((packages|dart-sdk)\/[^\s]+\/)');

  // /// Matches a stacktrace line as generated by browser Dart.
  // /// For example:
  // /// dart:sdk_internal
  // /// package:logger/src/logger.dart
  // static final _browserStackTraceRegex =
  //     RegExp(r'^(?:package:)?(dart:[^\s]+|[^\s]+)');

  static DateTime? _startTime;

  final int methodCount;
  final int errorMethodCount;
  final int lineLength;
  final bool colors;
  final bool printEmojis;
  final bool printTime;

  String _topBorder = '';
  String _middleBorder = '';
  String _bottomBorder = '';

  EtoPrinter({
    this.methodCount = 2,
    this.chat = false,
    this.errorMethodCount = 8,
    this.lineLength = 100,
    this.colors = true,
    this.printEmojis = true,
    this.printTime = false,
  }) {
    _isChat = chat;
    _startTime ??= DateTime.now();

    var doubleDividerLine = StringBuffer();
    var singleDividerLine = StringBuffer();
    for (var i = 0; i < lineLength - 1; i++) {
      doubleDividerLine.write(doubleDivider);
      singleDividerLine.write(singleDivider);
    }

    _topBorder = '$topLeftCorner$doubleDividerLine';
    _middleBorder = '$middleCorner$singleDividerLine';
    _bottomBorder = '$bottomLeftCorner$doubleDividerLine';
  }

  @override
  List<String> log(LogEvent event) {
    var messageStr = stringifyMessage(event.message);

    String? stackTraceStr;

    if (event.stackTrace == StackTrace.empty) {
      stackTraceStr = null;
    } else if (event.stackTrace == null) {
      if (methodCount > 0) {
        stackTraceStr = formatStackTrace(StackTrace.current, methodCount);
      }
    } else if (errorMethodCount > 0) {
      stackTraceStr = formatStackTrace(event.stackTrace!, errorMethodCount);
    }

    var errorStr = event.error?.toString();

    String? timeStr;
    if (printTime) {
      timeStr = getTime();
    }

    return _formatAndPrint(
      event.level,
      messageStr,
      timeStr,
      errorStr,
      stackTraceStr,
    );
  }

  String formatStackTrace(StackTrace stackTrace, int methodCount) {
    var lines = (stackTrace.toString().split('\n')).where((element) => element.startsWith("#") && element.contains("package:odenet/") && !element.contains("EtoPrinter.log"));
    var formatted = <String>[];
    var count = 0;
    for (var line in lines) {
      // if (_discardDeviceStacktraceLine(line) ||
      //     _discardWebStacktraceLine(line) ||
      //     _discardBrowserStacktraceLine(line)) {
      //   continue;
      // }
      formatted.add('#$count   ${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
      count++;
      // if (++count == methodCount) {
      //   break;
      // }
    }

    if (formatted.isEmpty) {
      return "null";
    } else {
      return formatted.join('\n');
    }
  }

  // bool _discardDeviceStacktraceLine(String line) {
  //   var match = _deviceStackTraceRegex.matchAsPrefix(line);
  //   if (match == null) {
  //     return false;
  //   }
  //   return match.group(2)!.startsWith('package:logger');
  // }

  // bool _discardWebStacktraceLine(String line) {
  //   var match = _webStackTraceRegex.matchAsPrefix(line);
  //   if (match == null) {
  //     return false;
  //   }
  //   return match.group(1)!.startsWith('packages/logger') ||
  //       match.group(1)!.startsWith('dart-sdk/lib');
  // }

  // bool _discardBrowserStacktraceLine(String line) {
  //   var match = _browserStackTraceRegex.matchAsPrefix(line);
  //   if (match == null) {
  //     return false;
  //   }
  //   return match.group(1)!.startsWith('package:logger') ||
  //       match.group(1)!.startsWith('dart:');
  // }

  String getTime() {
    String _threeDigits(int n) {
      if (n >= 100) return '$n';
      if (n >= 10) return '0$n';
      return '00$n';
    }

    String _twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    var now = DateTime.now();
    var h = _twoDigits(now.hour);
    var min = _twoDigits(now.minute);
    var sec = _twoDigits(now.second);
    var ms = _threeDigits(now.millisecond);
    var timeSinceStart = now.difference(_startTime!).toString();
    return '$h:$min:$sec.$ms (+$timeSinceStart)';
  }

  String stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = const JsonEncoder.withIndent('  ');
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }

  AnsiColor? _getLevelColor(Level level) {
    if (colors) {
      return levelColors[level];
    } else {
      return AnsiColor.none();
    }
  }

  // AnsiColor _getErrorColor(Level level) {
  //   if (colors) {
  //     if (level == Level.wtf) {
  //       return levelColors[Level.wtf]!.toBg();
  //     } else {
  //       return levelColors[Level.error]!.toBg();
  //     }
  //   } else {
  //     return AnsiColor.none();
  //   }
  // }

  String? _getEmoji(Level level) {
    if (printEmojis) {
      return levelEmojis[level];
    } else {
      return '';
    }
  }

  List<String> _formatAndPrint(
    Level? level,
    String? message,
    String? time,
    String? error,
    String? stacktrace,
  ) {
    // This code is non trivial and a type annotation here helps understanding.
    // ignore: omit_local_variable_types
    List<String> buffer = [];
    var color = _getLevelColor(level!);
    buffer.add(color!(_topBorder));

    if (error != null) {
      var errorColor = AnsiColor.fg(15);
      for (var line in error.split('\n')) {
        buffer.add(
          color('$verticalLine ') + errorColor.resetForeground + errorColor(line) + errorColor.resetBackground,
        );
      }
      buffer.add(color(_middleBorder));
    }

    if (stacktrace != null) {
      for (var line in stacktrace.split('\n')) {
        buffer.add('$color$verticalLine $line');
      }
      buffer.add(color(_middleBorder));
    }

    if (time != null) {
      buffer
        ..add(color('$verticalLine $time'))
        ..add(color(_middleBorder));
    }

    var emoji = _getEmoji(level);
    for (var line in message!.split('\n')) {
      buffer.add(color('$verticalLine $emoji$line'));
    }
    buffer.add(color(_bottomBorder));

    return buffer;
  }
}
