import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_listview_widget.dart';

part 'neo_bo_listview.g.dart';

@jsonWidget
abstract class _NeoBoListview extends JsonWidgetBuilder {
  const _NeoBoListview({
    required super.args,
  });

  @override
  NeoBoListView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NeoBoListView(
      title: args["title"],
    );
  }
}
