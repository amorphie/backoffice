import 'package:admin/screens/dashboard/tabs/history/history_tab.dart';
import 'package:admin/screens/dashboard/tabs/token/token_tab.dart';

import '../../../core/export/_.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
            backgroundColor: KC.background,
            appBar: AppBar(
              toolbarHeight: 90,
              backgroundColor: KC.primary,
              elevation: 1,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Ozan Deniz Demirtaş",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Tags : retail-customer, bank-staff",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.edit,
                        size: 18,
                      )
                    ],
                  ),
                  Text(
                    "Status : Active",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              bottom: TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(
                    icon: Text("Consents"),
                  ),
                  Tab(
                    icon: Text("Workflow"),
                  ),
                  Tab(
                    icon: Text("Transactions"),
                  ),
                  Tab(
                    icon: Text("History"),
                  ),
                  Tab(
                    icon: Text("Token"),
                  ),
                ],
              ),
            ),
            body: TabBarView(controller: _tabController, children: [
              ConsentTab(),
              WorkflowTab(),
              TransactionTab(),
              HistoryTab(),
              TokenTab(),
            ])),
      ),
    );
  }
}

Future<void> _editUser(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        iconPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        title: const Text('AlertDialog Title'),
        content: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: UserEditScreen()),
      );
    },
  );
}
