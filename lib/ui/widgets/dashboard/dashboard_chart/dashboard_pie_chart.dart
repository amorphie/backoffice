// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

import '../../../helpers/exporter.dart';

class DashboardPieChart extends StatelessWidget {
  final DashboardItemModel item;

  const DashboardPieChart({
    Key? key,
    required this.item,
  }) : super(key: key);

  int get total => item.data!.list.fold(0, (previousValue, element) => previousValue + element.value);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 300,
      height: 300,
      child: PieChart(
        PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (event, response) {},
            ),
            centerSpaceRadius: 0,
            sections: item.data!.list.map(
              (e) {
                return PieChartSectionData(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  title: e.title,
                  value: e.value * 1.0,
                  radius: 120,
                );
              },
            ).toList()),
      ),
    );
  }
}
