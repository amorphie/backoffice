import 'package:flutter/material.dart';

import 'package:admin/data/models/entity/layout_helpers/search_column_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../style/colors.dart';

class TabDataTable extends StatelessWidget {
  final Function(String val) onSearch;
  final bool loading;
  final bool withSearch;
  final List<SearchColumn> columns;
  final List data;
  final Function(Map<String, dynamic> data) onPressed;

  const TabDataTable({
    Key? key,
    required this.withSearch,
    required this.onSearch,
    this.loading = false,
    required this.columns,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading)
      return Center(
          child: SpinKitCircle(
        color: Theme.of(context).primaryColor,
      ));
    return Column(
      children: [
        if (withSearch) search(),
        Expanded(
          child: DataTable(
            rows: data
                .map((c) => DataRow(
                      cells: columns
                          .map((e) => DataCell(
                                Text(
                                  c[e.data].toString(),
                                  style: TextStyle(color: Colors.black54),
                                ),
                                onTap: () {
                                  onPressed(c);
                                },
                              ))
                          .toList(),
                    ))
                .toList(),
            columns: columns
                .map((e) => DataColumn(
                        label: Text(
                      e.title.enEN,
                      style: TextStyle(color: Colors.black87),
                    )))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget search() {
    return TextField(
      onSubmitted: onSearch,
      decoration: InputDecoration(hintText: "Search", prefixIconColor: KC.primary, prefixIcon: Icon(Icons.search), iconColor: KC.primary),
    );
  }
}
