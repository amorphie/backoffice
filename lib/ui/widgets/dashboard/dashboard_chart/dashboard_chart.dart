// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../helpers/exporter.dart';

class DashboardChart extends StatelessWidget {
  final DashboardItemModel item;

  const DashboardChart({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        switch (item.data!.chartType) {
          case ChartType.pie:
            return DashboardPieChart(
              item: item,
            );
          case ChartType.bar:
            return DashboardBarChart(
              item: item,
            );
          case ChartType.line:
            return DashboardLineChart(
              item: item,
            );
          default:
            return Container();
        }
      },
    );
  }
}
