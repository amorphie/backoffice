// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class DashboardTab extends StatelessWidget {
  final DashboardItemModel item;
  const DashboardTab({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: item.items!.length,
        initialIndex: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          Container(
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: KC.primary,
              tabs: item.items!.map((e) => Tab(text: e.title!.enEN)).toList(),
            ),
          ),
          Container(
              height: 300, //height of TabBarView
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: TabBarView(children: <Widget>[
                ...item.items!.map((e) => DashboardItem(item: e)).toList(),
              ]))
        ]));
  }
}
