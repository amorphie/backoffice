// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admin/data/models/entity/layout_helpers/search_column_model.dart';

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
                  Text(item[e.data].toString()),
                  onTap: () {
                    onPressed(item);
                  },
                ))
            .toList());
  }
}