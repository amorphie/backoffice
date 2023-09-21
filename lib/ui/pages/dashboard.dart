import 'package:admin/ui/widgets/dashboard/dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ui_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AppUiController c = Get.find<AppUiController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => DashboardItem(item: c.ui.dashboard.items[index]),
      itemCount: c.ui.dashboard.items.length,
    );
  }
}
