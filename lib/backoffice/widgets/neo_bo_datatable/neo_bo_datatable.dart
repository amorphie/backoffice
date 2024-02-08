import 'package:backoffice/backoffice/widgets/neo_bo_datatable/neo_bo_datatable_models/neo_bo_search_column_model.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_datatable_widget.dart';

part 'neo_bo_datatable.g.dart';

@jsonWidget
abstract class _NeoBoDatatable extends JsonWidgetBuilder {
  const _NeoBoDatatable({
    required super.args,
  });

  @override
  NeoBoPaginatedDatatableWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NeoBoPaginatedDatatableWidget(
      columns: args['columns'],
      data: args['data'],
      onFinish: args['onFinish'],
      onPressed: args['onPressed'],
      onRowsPerPageChanged: args['onRowsPerPageChanged'],
      rowsPerPage: args['rowsPerPage'],
      title: args['title'],
    );
  }
}
