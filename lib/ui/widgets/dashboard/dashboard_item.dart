// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../helpers/exporter.dart';

class DashboardItem extends StatelessWidget {
  final DashboardItemModel item;
  const DashboardItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      switch (item.type) {
        case DashboardType.counters:
          return DashboardCounter(item: item);
        case DashboardType.tab:
          return DashboardTab(item: item);
        case DashboardType.chart:
          return DashboardChart(item: item);
        case DashboardType.list:
          EntityController entityController = Get.find<EntityController>();
          AppUiController uiController = Get.find<AppUiController>();
          return TabDataTable(
            withSearch: false,
            onSearch: (val) {},
            columns: entityController.entities[item.entity]!.search.columns,
            data: uiController.dashboardListData[item.entity]!,
            onPressed: (val) {},
          );

        default:
          return Text(item.type.toString());
      }
    });
  }
}
