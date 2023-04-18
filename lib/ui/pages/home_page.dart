import 'package:admin/ui/components/detail_widget.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/responsive.dart';
import '../common/menu.dart';
import '../components/data_table/data_table.dart';
import '../controllers/menu_controller.dart';
import 'formio/formio.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AppMenuController menuController = Get.find<AppMenuController>();
  final EntityController entityController = Get.find<EntityController>();
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Obx(() {
        return Row(
          children: [
            if (Responsive.isDesktop(context)) AppMenu(),
            Expanded(
              child: Obx(
                () {
                  if (menuController.hasSelectedMenuItem) {
                    if (menuController.isWorkflowItem) {
                      return FormioPage();
                    }
                    return AppDataTable(
                      title: menuController.menuItem.value.title!,
                      data: entityController.dataList,
                      columns: entityController.entity.search?.columns ?? [],
                      loading: entityController.loading.value,
                      onPressed: (data) {
                        homeController.displayView.value = data;
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            // ),
            if (homeController.hasDisplayView)
              const Expanded(child: DetailWidget()),
          ],
        );
      }),
    );
  }
}
