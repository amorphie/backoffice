import 'package:admin/screens/tag/tag_screen.dart';

import '../../core/export/_exporter.dart';

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
    ConsentScreen(),
    TagScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(
        setIndex: (i) {
          setState(() {
            index = i;
          });
        },
      ),
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
                  child: SideMenu(
                    setIndex: (i) {
                      setState(() {
                        index = i;
                      });
                    },
                  ),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: page[index],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
