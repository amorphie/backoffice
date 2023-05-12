import 'package:admin/ui/components/detail_widget.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/responsive.dart';
import '../../style/colors.dart';
import '../common/menu.dart';
import '../components/data_table/data_table.dart';
import '../controllers/display_controller.dart';
import '../controllers/menu_controller.dart';
import 'formio/formio.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AppMenuController menuController = Get.find<AppMenuController>();
  final EntityController entityController = Get.find<EntityController>();
  final DisplayController displayController = Get.find<DisplayController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Row(
          children: [
            if (Responsive.isDesktop(context)) AppMenu(),
            Obx(
              () {
                if (menuController.hasSelectedMenuItem) {
                  if (menuController.isWorkflowItem) {
                    return FormioPage();
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppDataTable(
                        withSearch:
                            entityController.entity.search?.search ?? false,
                        title: menuController.menuItem.value.title!,
                        data: entityController.dataList,
                        columns: entityController.entity.search?.columns ?? [],
                        onSearch: (val) {
                          entityController.getDataList(searchText: val);
                        },
                        loading: entityController.loading.value,
                        onPressed: (data) {
                          displayController.setData(data);
                        },
                        addRessed: () {
                          formioDialog(context);
                        },
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            // ),
            if (displayController.hasDisplayView)
              const Expanded(child: DetailWidget()),
          ],
        );
      }),
    );
  }

  Future<void> formioDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Kullanıcı Ekle',
              style: TextStyle(color: KC.primary),
            ),
          ),
          content: Container(),
          actions: <Widget>[
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
