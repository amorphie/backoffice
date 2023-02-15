// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/ui/pages/resource/resource_page.dart';

import '../../../core/export/_.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({
    Key? key,
  }) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int index = 0;

  final page = [
    DashboardPage(),
    UserAddPage(),
    ConsentScreen(),
    TagScreen(),
    ResourcePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
