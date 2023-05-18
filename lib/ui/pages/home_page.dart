import 'dart:developer';

import 'package:admin/data/models/display/display_view_model.dart';
import 'package:admin/ui/components/detail_widget.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/home_controller.dart';
import 'package:admin/ui/controllers/workflow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../style/colors.dart';
import '../components/menu/menu.dart';
import '../components/data_table/data_table.dart';
import '../controllers/menu_controller.dart';
import '../components/formio/formio_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AppMenuController menuController = Get.find<AppMenuController>();
  final EntityController entityController = Get.find<EntityController>();
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        // if (Responsive.isDesktop(context))
        AppMenu(),

        Obx(
          () {
            if (menuController.hasSelectedMenuItem) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Row(
                          children: [
                            displayButton(title: menuController.menuItem.value.title!.trTR),
                            Expanded(
                              child: Obx(() {
                                return ListView.builder(
                                  itemCount: homeController.entityList.length,
                                  itemBuilder: (_, i) => displayButton(model: homeController.entityList[i]),
                                  scrollDirection: Axis.horizontal,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Obx(() {
                          log(DateTime.now().toIso8601String(), name: "EntityView");

                          if (homeController.hasEntity)
                            return homeController.selectedEntity.value.page;
                          else
                            return AppDataTable(
                              withSearch: entityController.entity.search?.search ?? false,
                              title: menuController.menuItem.value.title!,
                              data: entityController.dataList,
                              columns: entityController.entity.search?.columns ?? [],
                              onSearch: (val) {
                                entityController.getDataList(searchText: val);
                              },
                              loading: entityController.loading.value,
                              onPressed: (data) async {
                                await homeController.addData(data);
                                log(DateTime.now().toIso8601String(), name: "SelectEntityFinal");
                              },
                              addRessed: () async {
                                WorkflowController workflowController = Get.put<WorkflowController>(WorkflowController());
                                await workflowController.startTransition(
                                  entity: entityController.entity.create!.workflow,
                                  // recordId: "cf0a00ce-b0e5-4f0e-8c31-7e35cd4d4f5a",
                                );
                                formioDialog(context);
                              },
                            );
                        }),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        // ),
        // if (displayController.hasDisplayView) const Expanded(child: DetailWidget()),
      ],
    ));
  }

  Widget displayButton({DisplayViewModel? model, String? title}) => GestureDetector(
      onTap: () {
        log(DateTime.now().toIso8601String(), name: "SelectEntityStart");
        if (title == null) {
          homeController.selectEntity(model!);
        } else {
          homeController.deselectEntity();
        }
        log(DateTime.now().toIso8601String(), name: "SelectEntityEnd");
      },
      child: Container(
        height: 30,
        decoration: model == homeController.selectedEntity.value ? BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)) : null,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Text(
              title ?? model!.data["firstName"],
              style: TextStyle(color: Colors.black),
            ),
            if (title == null) SizedBox(width: 5.w),
            if (title == null)
              GestureDetector(
                onTap: () {
                  homeController.subtractData(model!);
                  homeController.deselectEntity();
                },
                child: Icon(Icons.close),
              )
          ],
        ),
      ));

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
          content: FormioPage(),
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
