/*
 * neo_bank
 *
 * Created on 16/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/pages/neo_component_page.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/bloc/neo_bottom_navigation_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/models/neo_bottom_navigation_model.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/widgets/neo_bottom_navigation_bar.dart';
import 'package:backoffice/reusable_widgets/neo_scaffold/neo_scaffold.dart';

class NeoBottomNavigationPage extends StatelessWidget {
  final List<NeoBottomNavigationModel> tabs;

  NeoBottomNavigationPage({
    required this.tabs,
    Key? key,
  }) : super(key: key);

  late final List<GlobalKey<NavigatorState>> _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
    tabs.length,
    (index) => GlobalKey<NavigatorState>(debugLabel: 'home_tab_$index'),
  );

  late final List<Navigator> _navigatorList = tabs
      .mapIndexed(
        (index, tab) => Navigator(
          key: _navigatorKeys[index],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(builder: (context) => NeoComponentPage(pageId: tab.pageId));
          },
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoBottomNavigationBloc(),
      child: BlocBuilder<NeoBottomNavigationBloc, NeoBottomNavigationState>(
        builder: (context, state) {
          return NeoScaffold(
            backWidgetEventKey: tabs[state.currentIndex].backWidgetEventKey,
            bottomNavigationBar: NeoBottomNavigationBar(tabs: tabs, onMoreOptionsTapped: _onMoreOptionsTapped),
            body: IndexedStack(index: state.currentIndex, children: _navigatorList),
          );
        },
      ),
    );
  }

  void _onMoreOptionsTapped() {
    // TODO: Open more options menu
  }
}
