import '../../../core/export/_exporter.dart';

class WorkflowScreen extends StatefulWidget {
  const WorkflowScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkflowScreen> createState() => _WorkflowScreenState();
}

class _WorkflowScreenState extends State<WorkflowScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 1.85,
      child: Scaffold(
          backgroundColor: KC.background,
          appBar: AppBar(
            backgroundColor: KC.secondary,
            elevation: 1,
            title: Text(
              "Ozan Deniz Demirtaş",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            bottom: TabBar(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  icon: Text("Consents"),
                ),
                Tab(
                  icon: Text("History"),
                ),
                Tab(
                  icon: Text("Transactions"),
                ),
              ],
            ),
          ),
          body: TabBarView(controller: _tabController, children: [
            ConsentTab(),
            HistoryTab(),
            TransactionTab(),
          ])),
    );
  }
}


  // Text(
  //             "User Details",
  //             style: TextStyle(
  //               fontSize: 18,
  //               color: Colors.black,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),

  //           Text(
  //             "Last login   03.01.2023",
  //             textAlign: TextAlign.left,
  //             style: TextStyle(color: Colors.black87, fontSize: 11),
  //           ),

// ConsentTab()