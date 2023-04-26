// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/ui/components/data_table/data_table_source.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/entity/layout_helpers/search_column_model.dart';
import 'package:admin/data/models/entity/layout_helpers/title_model.dart';

class AppDataTable extends StatelessWidget {
  final TitleModel title;
  final bool loading;
  final List<SearchColumn> columns;
  final List<Map<String, dynamic>> data;
  final Function(Map<String, dynamic> data) onPressed;

  const AppDataTable({
    Key? key,
    required this.title,
    this.loading = false,
    required this.columns,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 14),
          child: Text(
            title.trTR,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Builder(builder: (context) {
          if (loading) return Center(child: CircularProgressIndicator());
          return PaginatedDataTable(
            columns: columns
                .map((e) => DataColumn(
                        label: Text(
                      e.title.trTR,
                      style: TextStyle(color: Colors.black87),
                    )))
                .toList(),
            source: AppDataTableSource(
                data: data, columns: columns, onPressed: onPressed),
          );
        }),
      ],
    );
  }
}
