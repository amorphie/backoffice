// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyDataTable extends StatefulWidget {
  List<Map<String, dynamic>> data;
  List<Map<String, dynamic>> columns;
  Future Function() onPageEnd;

  MyDataTable({
    Key? key,
    required this.data,
    required this.columns,
    required this.onPageEnd,
  }) : super(key: key);

  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  List<Map<String, dynamic>> data = [];
  bool isLoading = false;

  final ScrollController _scrollController = ScrollController();
  int _pageIndex = 1; // Initial page index for API call
  int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> fetchData() async {
    // Simulate API request delay
    await Future.delayed(Duration(seconds: 1));

    // Replace this with your actual API endpoint
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=$_pageIndex&_limit=$_pageSize'));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> newData = (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

      setState(() {
        isLoading = false;
        data.addAll(newData);
        _pageIndex++;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge && _scrollController.position.pixels == 0) {
      // At the top
    } else if (_scrollController.position.atEdge && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // At the bottom
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic DataTable with Pagination'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            isLoading = true;
            data.clear();
            _pageIndex = 1;
          });
          await fetchData();
        },
        child: ListView(
          controller: _scrollController,
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Title')),
                DataColumn(label: Text('Body')),
              ],
              rows: List.generate(
                data.length,
                (index) => DataRow(cells: [
                  DataCell(Text(data[index]['id'].toString())),
                  DataCell(Text(data[index]['title'].toString())),
                  DataCell(Text(data[index]['body'].toString())),
                ]),
              ),
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
