import 'package:admin/data/services/user.dart';
import 'package:admin/ui/components/detail_widget.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            AppMenu(),
            Expanded(
              child: Obx(
                () {
                  if (menuController.hasSelectedMenuItem) {
                    return AppDataTable(
                      title: menuController.menuItem.value.title!,
                      data: entityController.userList,
                      columns: entityController.entity.search?.columns ?? [],
                      loading: entityController.loading.value,
                      onPressed: (data) {
                        homeController.displayView.value = data;
                      },
                    );
                  } else {
                    return const Expanded(child: FormioPage());
                  }
                },
              ),
            ),
            // ),
            if (homeController.hasDisplayView) Expanded(child: DetailWidget()),
          ],
        );
      }),
    );
  }
}
