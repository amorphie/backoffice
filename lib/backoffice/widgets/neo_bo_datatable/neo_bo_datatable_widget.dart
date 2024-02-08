import 'package:backoffice/backoffice/widgets/neo_bo_datatable/neo_bo_datatable_models/neo_bo_search_column_model.dart';
import 'package:backoffice/backoffice/widgets/neo_bo_datatable/neo_bo_datatable_source.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class NeoBoPaginatedDatatableWidget extends StatefulWidget {
  final int rowsPerPage;
  final Function(int) onRowsPerPageChanged;
  final Function() onFinish;
  final List<Map<String, dynamic>> data;
  final List<NeoBoSearchColumn> columns;
  final Function(Map<String, dynamic>) onPressed;
  final Function(String)? onSort;
  final bool sortAscending;
  final int? sortColumnIndex;
  final List<String> sortableColumns;

  const NeoBoPaginatedDatatableWidget({
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
    required title,
  }) : super(key: key);

  @override
  _NeoBoPaginatedDatatableWidgetState createState() => _NeoBoPaginatedDatatableWidgetState();
}

class _NeoBoPaginatedDatatableWidgetState extends State<NeoBoPaginatedDatatableWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Reached the bottom of the list
      widget.onFinish(); // Trigger data loading
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification) {
          // Check if reached the bottom of the list
          if (_scrollController.position.extentAfter == 0) {
            widget.onFinish(); // Trigger data loading
          }
        }
        return false;
      },
      child: PaginatedDataTable(
        sortAscending: widget.sortAscending,
        sortColumnIndex: widget.sortColumnIndex,
        rowsPerPage: widget.rowsPerPage,
        availableRowsPerPage: const [10, 20, 50],
        onRowsPerPageChanged: (int? value) {
          widget.onRowsPerPageChanged(value!);
        },
        columns: widget.columns
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
            .toList(),
        source: NeoBoPaginatedDataTableSource(data: widget.data, columns: widget.columns, onPressed: widget.onPressed),
      ),
    );
  }
}
