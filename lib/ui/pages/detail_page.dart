// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:admin/data/models/entity/entity_model.dart';
import 'package:admin/data/models/entity/layout_helpers/title_model.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/home_controller.dart';
import 'package:admin/ui/widgets/detail_page_items/display_item.dart';
import 'package:admin/ui/widgets/detail_page_items/display_tag_item.dart';
import 'package:admin/ui/widgets/detail_page_items/workflow_area.dart';
import 'package:admin/ui/widgets/history/history_list.dart';
import 'package:admin/ui/widgets/render/render_widget.dart';

import '../controllers/display_controller.dart';
import '../style/colors.dart';

class DetailWidget extends StatefulWidget {
  final String id;
  final String entity;
  const DetailWidget({
    Key? key,
    required this.id,
    required this.entity,
  }) : super(key: key);

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  HomeController get homeController => Get.find<HomeController>();
  EntityController get entityController => Get.find<EntityController>();
  DisplayController get displayController => Get.find<DisplayController>(tag: widget.id);

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: displayController.tabCount, vsync: this);
  }

  EntityModel get entity => entityController.entities[widget.entity]!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          children: [
            temp(context),
            DisplayTagList(
              id: homeController.selectedEntity.value.data["id"],
            ),
            WorkflowArea(
              id: homeController.selectedEntity.value.data["id"],
            ),
          ],
        ),
      ),
    );
  }

  Expanded temp(BuildContext context) {
    return Expanded(
      child: Container(
        child: Scaffold(
            backgroundColor: KC.background,
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: KC.primary,
              elevation: 1,
              title: getRenderWidget(displayController.displayLayout.summaryTemplate!),
              actions: [
                IconButton(
                    onPressed: () {
                      homeController.subtractData(homeController.selectedEntity.value);
                      homeController.deselectEntity();
                    },
                    icon: Icon(Icons.close))
              ],
              bottom: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: KC.secondary,
                  controller: _tabController,
                  indicatorColor: KC.secondary,
                  indicatorPadding: EdgeInsets.all(1),
                  isScrollable: false,
                  tabs: [
                    if (displayController.displayLayout.detailTemplate != null)
                      Tab(
                        icon: Text("Detail"),
                      ),
                    ...(displayController.displayLayout.tabs ?? [])
                        .map(
                          (e) => Tab(
                            icon: Text(e.title.enEN),
                          ),
                        )
                        .toList(),
                    if (entity.display!.history!)
                      Tab(
                        icon: Text("History"),
                      ),
                  ]),
            ),
            body: Obx(() {
              return TabBarView(controller: _tabController, children: [
                if (displayController.displayLayout.detailTemplate != null) getRenderWidget(displayController.displayLayout.detailTemplate!),
                ...(displayController.displayLayout.tabs ?? []).map((e) {
                  return DisplayTabItemWidget(
                    value: e,
                  );
                }).toList(),
                if (entity.display!.history!)
                  HistoryListWidget(
                    histories: displayController.historyWorkflows,
                  )
              ]);
            })),
      ),
    );
  }

  Widget getRenderWidget(TitleModel template) {
    return Obx(() {
      var t = displayController.templates[template.enEN];
      return RenderWidget(template: t);
    });
  }
}
