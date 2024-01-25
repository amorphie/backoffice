// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'neo_bo_tab_model.dart';

class NeoBoTabView extends StatefulWidget {
  final TabModel model;
  const NeoBoTabView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _NeoBoTabViewState createState() => _NeoBoTabViewState();
}

class _NeoBoTabViewState extends State<NeoBoTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: widget.model.title),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              widget.model.child,
            ]),
          ),
        ],
      ),
    );
  }
}
