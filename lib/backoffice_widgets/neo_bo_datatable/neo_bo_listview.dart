// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<String> items = List.generate(20, (index) => 'Item $index');
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

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Load more data when reaching the end of the list
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    // Simulating loading more data
    setState(() {
      items.addAll(List.generate(20, (index) => 'Item ${items.length + index}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scrolling ListView'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            tileColor: index % 2 == 0 ? Colors.grey[200] : null, // Optional: Alternate row colors
            onTap: () {
              // Handle item selection
              _handleItemSelection(items[index]);
            },
          );
        },
      ),
    );
  }

  void _handleItemSelection(String selectedItem) {
    // Implement your logic for handling item selection here
    print('Selected Item: $selectedItem');
  }
}
