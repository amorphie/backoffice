import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_summary_widget.dart';

part 'neo_bo_summary.g.dart';

@jsonWidget
abstract class _NeoBoSummary extends JsonWidgetBuilder {
  const _NeoBoSummary({
    required super.args,
  });

  @override
  NeoBoSummaryWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NeoBoSummaryWidget(
      name: args["name"],
      description: args["description"],
    );
  }
}
