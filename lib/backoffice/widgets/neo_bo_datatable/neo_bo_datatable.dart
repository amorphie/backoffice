// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/config/neo_navigation_config_model.dart';

class NeoSearchDataTable extends StatefulWidget {
  NeoNavigationConfigModel navigationConfig;
  List<Map<String, dynamic>> data;
  Future Function()? onPageEnd;
  Future Function()? onPageRefresh;

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
        .map((e) => DataColumn(
                label: Text(
              e.title.toString(), //TODO title verisinin language datası değişecek
            )))
        .toList();
  }

  List<DataRow> get _rows {
    return widget.data.map((e) => _row(e)).toList();
  }

  DataRow _row(Map<String, dynamic> data) {
    return DataRow(cells: [...widget.navigationConfig.columns.map((e) => DataCell(Text(data[e.data].toString()))).toList()]);
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
          DataTable(columns: _columns, rows: _rows),
        ],
      ),
    );
  }
}
