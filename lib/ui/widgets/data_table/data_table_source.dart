// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../helpers/exporter.dart';

class AppDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> data;
  final List<SearchColumn> columns;
  final Function(Map<String, dynamic> data) onPressed;
  AppDataTableSource({
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
                    style: TextStyle(color: Colors.black54),
                  ),
                  onTap: () {
                    onPressed(item);
                  },
                ))
            .toList());
  }

  String _print(dynamic item) {
    if (item is List)
      return item.join(", ");
    else
      return item.toString();
  }
}
