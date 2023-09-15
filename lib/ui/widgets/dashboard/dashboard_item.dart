// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/dashboard/dashboard_type.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/ui_controller.dart';
import 'package:admin/ui/widgets/dashboard/dashboard_counter/dashboard_counter.dart';
import 'package:admin/ui/widgets/dashboard/dashboard_tab/dashboard_tab.dart';
import 'package:admin/ui/widgets/tab_data_table/app_data_table/tab_data_table.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/dashboard/dashboard_item_model.dart';
import 'package:get/get.dart';

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
        case DashboardType.list:
          EntityController entityController = Get.find<EntityController>();
          AppUiController uiController = Get.find<AppUiController>();
          return TabDataTable(
            withSearch: false,
            onSearch: (val) {},
            columns: entityController.entities[item.entity]!.search!.columns,
            data: uiController.dashboardListData[item.entity]!,
            onPressed: (val) {},
          );

        default:
          return Text(item.type.toString());
      }
    });
  }
}
