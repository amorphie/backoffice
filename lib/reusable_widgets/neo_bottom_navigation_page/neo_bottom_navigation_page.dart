import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/bloc/neo_bottom_navigation_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/models/neo_bottom_navigation_model.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/widgets/neo_bottom_navigation_bar.dart';

class NeoBottomNavigationPage extends StatelessWidget {
  final List<NeoBottomNavigationModel> tabs;
  final VoidCallback onMoreOptionsTapped;

  const NeoBottomNavigationPage({
    required this.tabs,
    required this.onMoreOptionsTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
      tabs.length,
      (index) => GlobalKey<NavigatorState>(debugLabel: 'navigatorKey$index'),
    );
    return BlocProvider(
      create: (context) => NeoBottomNavigationBloc(),
      child: BlocBuilder<NeoBottomNavigationBloc, NeoBottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: NeoBottomNavigationBar(
              tabs: tabs,
              onMoreOptionsTapped: onMoreOptionsTapped,
            ),
            body: IndexedStack(
              index: state.currentIndex,
              children: [
                for (int i = 0; i < tabs.length; i++)
                  Navigator(
                    key: navigatorKeys[i],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(builder: (context) => tabs[i].page);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
