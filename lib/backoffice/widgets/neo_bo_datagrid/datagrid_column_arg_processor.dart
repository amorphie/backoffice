import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class DatagridColumnArgProcessor implements ArgProcessor {
  @override
  bool support(dynamic arg) {
    return arg != null && ((arg is String && arg == "columns") || (arg is Map && arg.containsKey("columns")));
  }

  @override
  ProcessedArg process(
    JsonWidgetRegistry registry,
    dynamic arg,
    Set<String>? jsonWidgetListenVariables,
  ) {
    final resultListenVariables = jsonWidgetListenVariables ?? <String>{};
    return ProcessedArg(
      jsonWidgetListenVariables: resultListenVariables,
      value: arg,
    );
  }
}
