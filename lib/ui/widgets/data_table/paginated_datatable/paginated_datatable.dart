// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_table_2/data_table_2.dart';

import '../../../helpers/exporter.dart';

/// Example without a datasource
class PaginatedDatatable extends StatelessWidget {
  final List<SearchColumn> rows;
  final int rowsPerPage;
  final Function(int) onRowsPerPageChanged;
  final Function() onFinish;
  final List<Map<String, dynamic>> data;
  final List<SearchColumn> columns;
  final Function(Map<String, dynamic>) onPressed;
  const PaginatedDatatable({
    Key? key,
    required this.rows,
    required this.rowsPerPage,
    required this.onRowsPerPageChanged,
    required this.onFinish,
    required this.data,
    required this.columns,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      columns: columns
          .map((e) => DataColumn(
                  label: Text(
                e.title.print(),
                style: TextStyle(color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              )))
          .toList(),
      rows: List<DataRow>.generate(
        rowsPerPage,
        (index) {
          var item = data[index];
          return DataRow(
            onSelectChanged: (value) {},
            cells: rows
                .map((e) => DataCell(
                      Text(
                        _print(e.data.jsWithData(item)),
                        style: TextStyle(color: Colors.black54),
                      ),
                      onTap: () {
                        onPressed(item);
                      },
                    ))
                .toList(),
          );
        },
      ),
    );
  }

  String _print(dynamic item) {
    if (item is List)
      return item.join(", ");
    else
      return item.toString();
  }
}
