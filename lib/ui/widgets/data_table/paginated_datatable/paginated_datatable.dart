// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/ui/helpers/exporter.dart';

class PaginatedDatatable extends StatelessWidget {
  final int rowsPerPage;
  final Function(int) onRowsPerPageChanged;
  final Function() onFinish;
  final List<Map<String, dynamic>> data;
  final List<SearchColumn> columns;
  final Function(Map<String, dynamic>) onPressed;
  final Function(String)? onSort;
  final bool sortAscending;
  final int? sortColumnIndex;
  final List<String> sortableColumns;
  const PaginatedDatatable({
    Key? key,
    required this.rowsPerPage,
    required this.onRowsPerPageChanged,
    required this.onFinish,
    required this.data,
    required this.columns,
    required this.onPressed,
    this.onSort,
    this.sortAscending = true,
    this.sortColumnIndex,
    this.sortableColumns = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      sortAscending: sortAscending,
      sortColumnIndex: sortColumnIndex,
      rowsPerPage: rowsPerPage,
      availableRowsPerPage: [10, 20, 50],
      onRowsPerPageChanged: (value) {
        if (value != null) {
          onRowsPerPageChanged(value);
        }
      },
      onPageChanged: (value) {
        if (value + rowsPerPage == data.length) {
          onFinish();
        }
      },
      columns: columns
          .map((e) => DataColumn(
              onSort: sortableColumns.contains(e.data)
                  ? (columnIndex, ascending) {
                      onSort!(e.data);
                    }
                  : null,
              label: Text(
                e.title.print(),
                style: TextStyle(color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              )))
          .toList(),
      source: PaginatedDataTableSource(data: data, columns: columns, onPressed: onPressed),
    );
  }
}
