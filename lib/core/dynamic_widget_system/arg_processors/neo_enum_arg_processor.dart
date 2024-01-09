/*
 * neo_bank
 *
 * Created on 13/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class NeoEnumArgProcessor implements ArgProcessor {
  static const _splitter = ".";

  final String type;
  final Function(String) fromJson;

  NeoEnumArgProcessor({required this.type, required this.fromJson});

  @override
  bool support(dynamic arg) {
    return arg != null && arg is String && arg.startsWith("$type$_splitter");
  }

  @override
  ProcessedArg process(
    JsonWidgetRegistry registry,
    dynamic arg,
    Set<String>? listenVariables,
  ) {
    return ProcessedArg(
      jsonWidgetListenVariables: listenVariables ?? <String>{},
      value: fromJson((arg as String).split(_splitter)[1]),
    );
  }
}
