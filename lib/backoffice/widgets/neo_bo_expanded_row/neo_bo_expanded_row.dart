import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_expanded_row_widget.dart';

part 'neo_bo_expanded_row.g.dart';

@jsonWidget
abstract class _NeoBoExpandedRow extends JsonWidgetBuilder {
  const _NeoBoExpandedRow({
    required super.args,
  });

  @override
  NeoBoExpandedRowWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NeoBoExpandedRowWidget(
      data: args["data"],
      isTitle: args["isTitle"] ?? false,
    );
  }
}
