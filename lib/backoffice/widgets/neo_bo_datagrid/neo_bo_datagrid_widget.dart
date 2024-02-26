// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:backoffice/backoffice/widgets/neo_bo_expanded_row/neo_bo_expanded_row_widget.dart';
import 'package:flutter/material.dart';

import '../neo_bo_detail_item_title/neo_bo_detail_item_title_widget.dart';

class NeoBoDatagridWidget extends StatelessWidget {
  final String title;
  final Map<String, dynamic> columns;
  final List<Map<String, dynamic>> data;

  const NeoBoDatagridWidget({
    Key? key,
    required this.title,
    required this.columns,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NeoBoDetailItemTitleWidget(title: title),
        NeoBoExpandedRowWidget(data: [
          for (var col in columns.keys) columns[col],
        ], isTitle: true),
        NeoBoExpandedRowWidget(data: [
          for (var row in data)
            NeoBoExpandedRowWidget(
              data: [
                for (var col in columns.keys) row[col],
              ],
            ),
        ]),
      ],
    );
  }
}
