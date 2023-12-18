import 'dart:developer';

import 'package:admin/ui/controllers/workflow_instance/workflow_instance_controller.dart';

import '../helpers/exporter.dart';

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
                        height: 50,
                        child: Row(
                          children: [
                            displayButton(title: menuController.menuItem.title!.print()),
                            Expanded(
                              child: Obx(() {
                                return ListView.builder(
                                  itemCount: homeController.displayList.length,
                                  itemBuilder: (_, i) => displayButton(model: homeController.displayList[i]),
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
                            return homeController.displayView.page;
                          else
                            return AppDataTable(
                              onFinish: () {
                                log("finish", name: "onPageChanged");
                                entityController.onPageChange();
                              },
                              rowsPerPage: homeController.rowPerPage,
                              onRowsPerPageChanged: homeController.setRowPerPage,
                              withEndpointSuffix: entityController.entity.search.endpointSuffix ?? false,
                              filterView: homeController.filterView,
                              withSearch: entityController.entity.search.search,
                              data: entityController.dataList,
                              columns: entityController.entity.search.columns,
                              hasFilter: entityController.entity.hasFilter,
                              entityLoading: homeController.addDataLoading,
                              filterPressed: () async {
                                if (homeController.filterView) {
                                  await entityController.refreshList();
                                  homeController.filterClose();
                                } else {
                                  await homeController.getFilterArea();
                                }
                              },
                              onSearch: (val) {
                                entityController.onSearch(val);
                              },
                              onEndpointSuffix: (val) {
                                entityController.onEndpointSuffixSend(val);
                              },
                              loading: entityController.loading,
                              onPressed: (data) async {
                                await homeController.selectDisplayData(data);
                                log(DateTime.now().toIso8601String(), name: "SelectEntityFinal");
                              },
                              addPressed: () async {
                                WorkflowInstanceController controller = Get.put<WorkflowInstanceController>(WorkflowInstanceController());
                                if (entityController.entity.workflow.name != null) controller.initWithWorkflowName(entityController.entity.workflow.name!);

                                // formioDialog(context);
                              },
                              onSort: (val) {
                                entityController.onSort(val);
                              },
                              sortAscending: entityController.sortColumn.sortAscending,
                              sortColumnIndex: entityController.sortColumnIndex,
                              sortableColumns: entityController.entity.search.sort?.columns ?? [],
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
                    Expanded(child: Dashboard()),
                    // Expanded(child: Center(child: Text("HomePage"))),
                    Text("v1.0.2"),
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

  Widget displayButton({DisplayViewModel? model, String? title}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 4),
        child: Tooltip(
          message: model?.entity ?? "",
          // message: menuController.menuItem.value.title!.print(),

          child: GestureDetector(
              onTap: () {
                if (title == null) {
                  homeController.setDisplayView(model!);
                } else {
                  homeController.deselectEntity();
                }
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  decoration: homeController.equalDisplayView(model)
                      ? BoxDecoration(borderRadius: BorderRadius.circular(20), color: KC.secondary)
                      : title == null
                          ? BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(), color: Colors.transparent)
                          : null,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          title ?? entityController.entities[model!.entity]?.search.titleTemplate.templateWithData(model.data) ?? model!.id,
                          style: TextStyle(color: homeController.equalDisplayView(model) ? Colors.white : Colors.black, fontSize: 16),
                        ),
                      ),
                      if (title == null) SizedBox(width: 5),
                      if (title == null)
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: GestureDetector(
                              onTap: () {
                                homeController.subtractData(model!);
                              },
                              child: Icon(Icons.close, size: 18, color: homeController.equalDisplayView(model) ? KC.background : KC.primary)),
                        )
                    ],
                  ),
                ),
              )),
        ),
      );

  Future<void> formioDialog(BuildContext context, [String? recordId]) async {
    WorkflowController controller = Get.put<WorkflowController>(WorkflowController());
    await controller.startTransition(
      entity: entityController.entity.workflow.entity,
      recordId: recordId,
      //TODO TEst ederken buraya record id elle yazılabilir
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
              content: TransitionPage(),
            ),
          );
        });
      },
    );
  }
}
