// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/dashboard/dashboard_item_model.dart';

class DashboardBarChart extends StatelessWidget {
  final DashboardItemModel item;

  const DashboardBarChart({
    Key? key,
    required this.item,
  }) : super(key: key);

  int get total => item.data!.list.fold(0, (previousValue, element) => previousValue + element.value);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: BarChart(
        BarChartData(
            barGroups: item.data!.list.map(
          (e) {
            print(e.value);
            return BarChartGroupData(
              x: e.value,
            );
          },
        ).toList()),
      ),
    );
  }
}
