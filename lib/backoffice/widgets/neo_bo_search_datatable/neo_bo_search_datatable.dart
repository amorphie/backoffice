// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_path/json_path.dart';

import 'package:backoffice/backoffice/widgets/neo_bo_datatable/neo_bo_datatable_models/neo_bo_search_column_model.dart';

import '../../models/config/neo_navigation_config_model.dart';

// ignore: must_be_immutable
class NeoSearchDataTable extends StatefulWidget {
  final NeoNavigationConfigModel navigationConfig;
  final List<Map<String, dynamic>> data;
  final Future Function()? onPageEnd;
  final Future Function()? onPageRefresh;
  int? sortColumnIndex = 0;
  bool sortAscending;
  final List<String> sortableColumns;
  final Function(String)? onSort;
  final List<NeoBoSearchColumn> columns;

  NeoSearchDataTable({
    Key? key,
    required this.navigationConfig,
    required this.data,
    this.onPageEnd,
    this.onPageRefresh,
    this.sortColumnIndex,
    required this.sortAscending,
    required this.sortableColumns,
    this.onSort,
    required this.columns,
  }) : super(key: key);

  @override
  _NeoSearchDataTableState createState() => _NeoSearchDataTableState();
}

class _NeoSearchDataTableState extends State<NeoSearchDataTable> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> onPageRefresh() async {
    await widget.onPageRefresh?.call();
  }

  Future<void> onPageEnd() async {
    await widget.onPageEnd?.call();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge && _scrollController.position.pixels == 0) {
      // At the top
    } else if (_scrollController.position.atEdge && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // At the bottom
      onPageRefresh();
    }
  }

  List<DataColumn> get _columns {
    return widget.columns
        .map((e) => DataColumn(
              onSort: widget.sortableColumns.contains(e.data)
                  ? (columnIndex, ascending) {
                      widget.onSort!(e.data);
                    }
                  : null,
              label: Text(
                e.title.print(),
                style: const TextStyle(color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
            ))
        .toList();
  }

  List<DataRow> get _rows {
    return widget.data.map((e) => _row(e)).toList();
  }

  DataRow _row(Map<String, dynamic> data) {
    return DataRow(
      cells: widget.navigationConfig.columns
          .map(
            (e) => DataCell(
              Text(
                JsonPath(e.data).read(data).firstOrNull?.value?.toString() ?? "",
              ),
            ),
          )
          .toList(),
      selected: false,
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          // Handle row selection
        }
      },
    );
  }

  void _sort(int columnIndex, bool ascending) {
    widget.data.sort((a, b) {
      final aValue = a[widget.navigationConfig.columns[columnIndex].data];
      final bValue = b[widget.navigationConfig.columns[columnIndex].data];
      if (aValue is String && bValue is String) {
        return ascending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
      }
      return 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await onPageRefresh();
      },
      child: ListView(
        controller: _scrollController,
        children: [
          DataTable(
            sortAscending: widget.sortAscending,
            sortColumnIndex: widget.sortColumnIndex,
            columns: _columns,
            rows: _rows,
          ),
        ],
      ),
    );
  }
}
