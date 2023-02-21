import '../../../../core/export/_.dart';

class UserDetailScreen extends StatefulWidget {
  final UserModel user;
  const UserDetailScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> with TickerProviderStateMixin {
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
        height: MediaQuery.of(context).size.height / 1.14,
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
                      Icon(Icons.accessibility),
                      SizedBox(width: 10),
                      Text(
                        widget.user.fullName,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Text(
                        "Tags : ${widget.user.tags}",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          tagPopUp(context);
                        },
                        child: Icon(
                          Icons.edit,
                          size: 18,
                        ),
                      )
                    ],
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
