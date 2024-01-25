// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class NeoBoListView extends StatefulWidget {
  @override
  _NeoBoListViewState createState() => _NeoBoListViewState();
}

class _NeoBoListViewState extends State<NeoBoListView> {
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

  void _handleItemSelection(String selectedItem) {
    // Implement your logic for handling item selection here
    // ignore: avoid_print
    print('Selected Item: $selectedItem');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
