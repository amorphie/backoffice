import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_datagrid_widget.dart';

part 'neo_bo_datagrid.g.dart';

@jsonWidget
abstract class _NeoBoDatagrid extends JsonWidgetBuilder {
  const _NeoBoDatagrid({
    required super.args,
  });

  @override
  NeoBoDatagridWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NeoBoDatagridWidget(
      title: args["title"],
      columns: args["columns"],
      data: args["data"],
    );
  }
}
