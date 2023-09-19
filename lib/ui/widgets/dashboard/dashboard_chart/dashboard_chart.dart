// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/dashboard/dashboard_chart_type.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/dashboard/dashboard_item_model.dart';

import 'dashboard_bar_chart.dart';
import 'dashboard_line_chart.dart';
import 'dashboard_pie_chart.dart';

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
