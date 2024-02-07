import 'package:flutter/material.dart';

class NeoBoListView extends StatefulWidget {
  final String title;

  const NeoBoListView({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _NeoBoListViewState createState() => _NeoBoListViewState();
}

class _NeoBoListViewState extends State<NeoBoListView> {
  List<String> items = List.generate(20, (index) => 'Item $index');
  final ScrollController _scrollController = ScrollController();
  String _sortOption = 'Default'; // Default sort option

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

  void _sortList(String option) {
    setState(() {
      _sortOption = option;
      switch (_sortOption) {
        case 'Default':
          // No sorting, keep the list as it is
          break;
        case 'Ascending':
          items.sort();
          break;
        case 'Descending':
          items.sort((a, b) => b.compareTo(a));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown button for sort option
        DropdownButton<String>(
          value: _sortOption,
          onChanged: (String? value) {
            _sortList(value ?? '');
          },
          items: <String>['Default', 'Ascending', 'Descending'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]), // Show the item text
                tileColor: index % 2 == 0 ? Colors.grey[200] : null, // Optional: Alternate row colors
                onTap: () {
                  // Handle item selection
                  _handleItemSelection(items[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
