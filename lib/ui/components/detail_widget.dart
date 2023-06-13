// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/workflow/altmodels/transitions.dart';
import 'package:admin/data/models/workflow/workflow_model.dart';
import 'package:admin/ui/components/tab_data_table/app_data_table/tab_data_table.dart';
import 'package:admin/ui/controllers/workflow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'package:admin/data/models/entity/layout_helpers/title_model.dart';
import 'package:admin/ui/controllers/home_controller.dart';

import '../controllers/display_controller.dart';
import '../style/colors.dart';
import 'formio/formio_widget.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  HomeController get homeController => Get.find<HomeController>();
  DisplayController get displayController => Get.find<DisplayController>(tag: homeController.selectedEntity.value.data["id"]);
  WorkflowController get workflowController => Get.find<WorkflowController>(tag: homeController.selectedEntity.value.data["id"]);

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: displayController.tabCount, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          children: [
            temp(context),
            Obx(() {
              return workflowArea(workflowController.workflow);
            }),
          ],
        ),
      ),
    );
  }

  Widget workflowArea(WorkflowModel workflow) {
    return Container(
      color: KC.primary,
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          workflowRow(workflow.stateManager.title! + " : ", workflow.stateManager.transitions!),
          ...workflow.availableWorkflows!.map((e) => workflowRow(e.title! + " : ", e.transitions!)).toList()
        ],
      ),
    );
  }

  Widget workflowRow(String title, List<TransitionsModel> transitions) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          ...transitions
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    _showFormio(e);
                  },
                  child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        e.title ?? e.name!,
                        style: TextStyle(fontSize: 14.sp),
                      )),
                ),
              )
              .toList()
        ],
      ),
    );
  }

  Expanded temp(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        child: Scaffold(
            backgroundColor: KC.background,
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: KC.primary,
              elevation: 1,
              title: Obx(() {
                return getRenderWidget(displayController.displayLayout.summaryTemplate!);
              }),
              actions: [
                IconButton(
                    onPressed: () {
                      homeController.subtractData(homeController.selectedEntity.value);
                      homeController.deselectEntity();
                    },
                    icon: Icon(Icons.close))
              ],
              bottom: TabBar(controller: _tabController, tabs: [
                if (displayController.displayLayout.detailTemplate != null)
                  Tab(
                    icon: Text("Detay"),
                  ),
                ...displayController.displayLayout.tabs!
                    .map(
                      (e) => Tab(
                        icon: Text(e.title.enEN),
                      ),
                    )
                    .toList()
              ]),
            ),
            body: TabBarView(controller: _tabController, children: [
              if (displayController.displayLayout.detailTemplate != null) getRenderWidget(displayController.displayLayout.detailTemplate!),
              ...displayController.displayLayout.tabs!
                  .map((e) => Container(
                        child: e.type == "render"
                            ? getRenderWidget(e.template!)
                            : e.type == "search"
                                ? Obx(
                                    () => TabDataTable(
                                      withSearch: displayController.searchModels[e.entity]!.entity.search!.search,
                                      onSearch: (val) {
                                        displayController.search(entity: e.entity, keyword: val);
                                      },
                                      columns: displayController.searchModels[e.entity]!.entity.search!.columns,
                                      data: displayController.searchModels[e.entity]!.data,
                                      onPressed: (data) {},
                                    ),
                                  )
                                : Container(),
                      ))
                  .toList()
            ])),
      ),
    );
  }

  Widget getRenderWidget(TitleModel template) {
    var t = displayController.templates[template.enEN];
    return JsonWidgetData.fromDynamic(
      t,
      registry: JsonWidgetRegistry.instance,
    )!
        .build(context: context);
  }

  Future<void> _showFormio(TransitionsModel data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: FormioWidget(
            data: data,
            getData: (val) async {
              await workflowController.postTransition(transition: data, entityData: val);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
