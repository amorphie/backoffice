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
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 1.84,
          child: Scaffold(
              backgroundColor: KC.background,
              appBar: AppBar(
                backgroundColor: KC.secondary,
                elevation: 1,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ozan Deniz Demirtaş",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "retail-customer, bank-staff",
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
        ),
      ),
    );
  }
}
