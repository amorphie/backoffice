/*
 * 
 * Neobank.Client
 * 
 * Created on 13/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class _Constants {
  _Constants._();
  static const String typeKey = "type";
}

class NeoModelArgProcessor implements ArgProcessor {
  final String type;
  final Function(Map<String, dynamic>) fromJson;

  NeoModelArgProcessor({required this.type, required this.fromJson});

  @override
  bool support(dynamic arg) {
    return arg != null &&
        arg is Map<String, dynamic> &&
        arg.containsKey(_Constants.typeKey) &&
        arg[_Constants.typeKey] == type;
  }

  @override
  ProcessedArg process(JsonWidgetRegistry registry, dynamic arg, Set<String>? listenVariables) {
    return ProcessedArg(
      jsonWidgetListenVariables: listenVariables ?? <String>{},
      value: fromJson(arg as Map<String, dynamic>),
    );
  }
}
