import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_path/json_path.dart';

import '../../models/config/neo_navigation_config_model.dart';

class NeoSearchDataTable extends StatefulWidget {
  final NeoNavigationConfigModel navigationConfig;
  final List<Map<String, dynamic>> data;
  final Future Function()? onPageEnd;
  final Future Function()? onPageRefresh;

  NeoSearchDataTable({
    Key? key,
    required this.data,
    required this.navigationConfig,
    this.onPageEnd,
    this.onPageRefresh,
  }) : super(key: key);

  @override
  _NeoSearchDataTableState createState() => _NeoSearchDataTableState();
}

class _NeoSearchDataTableState extends State<NeoSearchDataTable> {
  final ScrollController _scrollController = ScrollController();
  bool _sortAscending = true;
  int _sortColumnIndex = 0;

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
    return widget.navigationConfig.columns
        .asMap()
        .map((index, column) => MapEntry(
              index,
              DataColumn(
                label: Text(
                  column.title["en-EN"].toString(), //TODO title verisinin language datası değişecek
                ),
                onSort: (columnIndex, ascending) {
                  _sortColumnIndex = columnIndex;
                  setState(() {
                    _sortAscending = ascending;
                    _sort(index, ascending);
                  });
                },
              ),
            ))
        .values
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
                JsonPath(e.data.replaceAll(".data", "")).read(data).firstOrNull?.value?.toString() ?? "",
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
            sortAscending: _sortAscending,
            sortColumnIndex: _sortColumnIndex,
            columns: _columns,
            rows: _rows,
          ),
        ],
      ),
    );
  }
}
