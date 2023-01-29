import 'package:admin/core/controllers/MenuController.dart';
import 'package:admin/core/utils/responsive.dart';
import 'package:admin/screens/consent/consent_screen.dart';
import 'package:admin/screens/home/dashboard_screen.dart';
import 'package:admin/screens/user/user_history.dart';
import 'package:admin/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final page = [
    DashboardScreen(),
    UserScreen(),
    UserHistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // switch (index) {
    //   case 0:
    //     {
    //       DashboardScreen();
    //     }
    //     break;

    //   case 1:
    //     {
    //       UserScreen();
    //     }
    //     break;

    //   case 2:
    //     {
    //       UserHistoryScreen();
    //     }
    //     break;

    //   default:
    //     {
    //       DashboardScreen();
    //     }
    //     break;
    // }

    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.grey[300]),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: ConsentScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
