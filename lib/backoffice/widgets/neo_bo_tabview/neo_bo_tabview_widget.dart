// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'neo_bo_tabview_model.dart';

class NeoBoTabView extends StatefulWidget {
  final List<NeoBoTabViewModel> items;
  const NeoBoTabView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _NeoBoTabViewState createState() => _NeoBoTabViewState();
}

class _NeoBoTabViewState extends State<NeoBoTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.items.length,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints.expand(height: 30),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              tabs: widget.items
                  .map((e) => Tab(
                        text: e.title,
                        iconMargin: EdgeInsets.all(3),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.items.map((e) => e.tab).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
