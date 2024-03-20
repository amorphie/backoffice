// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class DashboardLineChart extends StatelessWidget {
  final DashboardItemModel item;

  const DashboardLineChart({
    Key? key,
    required this.item,
  }) : super(key: key);

  int get total => item.data!.list.fold(0, (previousValue, element) => previousValue + element.value);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: LineChart(
        LineChartData(
            lineBarsData: item.data!.list.map(
          (e) {
            print(e.value);
            return LineChartBarData(
              barWidth: e.value * 1.0,
            );
          },
        ).toList()),
      ),
    );
  }
}
