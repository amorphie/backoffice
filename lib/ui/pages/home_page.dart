import 'dart:developer';

import 'package:admin/data/extension/string_extension.dart';
import 'package:admin/data/models/display/display_view_model.dart';
import 'package:admin/ui/widgets/indicator.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/home_controller.dart';
import 'package:admin/ui/controllers/workflow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/colors.dart';
import '../widgets/menu/menu.dart';
import '../widgets/data_table/data_table.dart';
import '../controllers/ui_controller.dart';
import '../widgets/formio/formio_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AppUiController menuController = Get.find<AppUiController>();
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
                            if (homeController.hasEntity) displayButton(title: menuController.menuItem.value.title!.enEN),
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
                          if (homeController.hasEntity)
                            return homeController.selectedEntity.value.page;
                          else
                            return AppDataTable(
                              filterView: homeController.filterView,
                              withSearch: entityController.entity.search?.search ?? false,
                              title: menuController.menuItem.value.title!,
                              data: entityController.dataList,
                              columns: entityController.entity.search?.columns ?? [],
                              hasFilter: entityController.entity.hasFilter,
                              filterPressed: () async {
                                if (homeController.filterView) {
                                  homeController.filterClose();
                                } else {
                                  await homeController.getFilterArea();
                                }
                              },
                              onSearch: (val) {
                                entityController.setFilter(val);
                              },
                              loading: entityController.loading.value,
                              onPressed: (data) async {
                                await homeController.addData(data);
                                log(DateTime.now().toIso8601String(), name: "SelectEntityFinal");
                              },
                              addPressed: () async {
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
              // return Expanded(child: Dashboard());
              return Expanded(
                child: Column(
                  children: [
                    // Expanded(child: Dashboard()),
                    Expanded(child: Center(child: Text("HomePage"))),
                    Text("v1.0.0"),
                  ],
                ),
              );
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
        decoration: model == homeController.selectedEntity.value ? BoxDecoration(borderRadius: BorderRadius.circular(20), color: KC.secondary) : null,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title ?? entityController.entity.titleTemplate.templateWithData(model!.data),
                style: model == homeController.selectedEntity.value ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            if (title == null) SizedBox(width: 5),
            if (title == null)
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: GestureDetector(
                    onTap: () {
                      homeController.subtractData(model!);
                      homeController.deselectEntity();
                    },
                    child: model == homeController.selectedEntity.value
                        ? Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.white,
                          )
                        : SizedBox(width: 0)),
              )
          ],
        ),
      ));

  Future<void> formioDialog(BuildContext context, [String? recordId]) async {
    WorkflowController controller = Get.put<WorkflowController>(WorkflowController());
    await controller.startTransition(
      entity: entityController.entity.workflow,
      recordId: recordId,
    );

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Obx(() {
          if (controller.loading) return AppIndicator();
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: AlertDialog(
              actionsPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.workflow.stateManager?.title ?? "",
                      style: TextStyle(color: KC.primary, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          entityController.getDataList();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: KC.primary,
                        ))
                  ],
                ),
              ),
              content: FormioPage(),
            ),
          );
        });
      },
    );
  }
}
