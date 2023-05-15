// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/ui/components/data_table/data_table_source.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/entity/layout_helpers/search_column_model.dart';
import 'package:admin/data/models/entity/layout_helpers/title_model.dart';

import '../../style/colors.dart';

class AppDataTable extends StatelessWidget {
  final TitleModel title;
  final Function(String val) onSearch;
  final Function addRessed;
  final bool loading;
  final bool withSearch;
  final List<SearchColumn> columns;
  final List<Map<String, dynamic>> data;
  final Function(Map<String, dynamic> data) onPressed;

  const AppDataTable({
    Key? key,
    required this.title,
    required this.withSearch,
    required this.onSearch,
    required this.addRessed,
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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ),
        Builder(builder: (context) {
          if (loading) return Center(child: CircularProgressIndicator());
          return PaginatedDataTable(
            header: Row(
              children: [
                if (withSearch) search(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_rounded,
                      color: KC.primary,
                      size: 32,
                    )),
                IconButton(
                    onPressed: () {
                      addRessed();
                    },
                    icon: Icon(
                      Icons.add_circle_outlined,
                      color: KC.primary,
                      size: 32,
                    ))
              ],
            ),
            columns: columns
                .map((e) => DataColumn(
                        label: Text(
                      e.title.trTR,
                      style: TextStyle(color: Colors.black87),
                    )))
                .toList(),
            source: AppDataTableSource(data: data, columns: columns, onPressed: onPressed),
          );
        }),
      ],
    );
  }

  Expanded search() {
    return Expanded(
      child: TextField(
        onSubmitted: onSearch,
        decoration: InputDecoration(hintText: "Search", prefixIconColor: KC.primary, prefixIcon: Icon(Icons.search), iconColor: KC.primary),
      ),
    );
  }
}
