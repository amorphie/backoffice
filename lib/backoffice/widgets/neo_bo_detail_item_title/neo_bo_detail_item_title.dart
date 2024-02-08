import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_detail_item_title_widget.dart';

part 'neo_bo_detail_item_title.g.dart';

@jsonWidget
abstract class _NeoBoDetailItemTitle extends JsonWidgetBuilder {
  const _NeoBoDetailItemTitle({
    required super.args,
  });

  @override
  NeoBoDetailItemTitleWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NeoBoDetailItemTitleWidget(
      title: args["title"],
    );
  }
}
