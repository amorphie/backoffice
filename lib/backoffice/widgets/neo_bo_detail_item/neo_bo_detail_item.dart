import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_detail_item_widget.dart';

part 'neo_bo_detail_item.g.dart';

@jsonWidget
abstract class _NeoBoDetailItem extends JsonWidgetBuilder {
  const _NeoBoDetailItem({
    required super.args,
  });

  @override
  NeoBoDetailItemWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NeoBoDetailItemWidget(
      title: args["title"],
      text: args["text"],
      copyValue: args["copyValue"],
    );
  }
}
