// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:backoffice/backoffice/widgets/neo_bo_datatable/neo_bo_datatable_models/neo_bo_search_column_model.dart';
import 'package:backoffice/backoffice/widgets/neo_bo_datatable/neo_bo_datatable_models/neo_bo_string_extension.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class NeoBoPaginatedDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> data;
  final List<NeoBoSearchColumn> columns;
  final Function(Map<String, dynamic> data) onPressed;
  NeoBoPaginatedDataTableSource({
    required this.data,
    required this.columns,
    required this.onPressed,
  });
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow? getRow(int index) {
    var item = data[index];
    return DataRow(
        cells: columns
            .map((e) => DataCell(
                  Text(
                    _print(e.data.jsWithData(item)),
                    style: const TextStyle(color: Colors.black54),
                  ),
                  onTap: () {
                    onPressed(item);
                  },
                ))
            .toList());
  }

  String _print(dynamic item) {
    if (item is List) {
      return item.join(", ");
    } else {
      return item.toString();
    }
  }
}
