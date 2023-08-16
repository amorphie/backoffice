// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/data/models/history/history_model.dart';
import 'package:admin/ui/components/detail_page_items/workflow_area.dart';
import 'package:admin/ui/components/formio/formio_widget.dart';
import 'package:admin/ui/components/history/history_list.dart';
import 'package:admin/ui/components/tab_data_table/app_data_table/tab_data_table.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'package:admin/data/models/entity/layout_helpers/title_model.dart';
import 'package:admin/ui/controllers/home_controller.dart';

import '../controllers/display_controller.dart';
import '../style/colors.dart';

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
  EntityController get entityController => Get.find<EntityController>();
  DisplayController get displayController => Get.find<DisplayController>(tag: homeController.selectedEntity.value.data["id"]);
  JsonWidgetRegistry registry = JsonWidgetRegistry.instance;

  @override
  void initState() {
    super.initState();
    registry.registerFunction(
        "copy",
        ({args, required registry}) => () async {
              if (args != null && args.length > 0) {
                await Clipboard.setData(ClipboardData(text: args.first.toString()));
                Get.snackbar("Info", "Data copied to clipboard");
              }
            });
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
      flex: 5,
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
              bottom: TabBar(controller: _tabController, tabs: [
                if (displayController.displayLayout.detailTemplate != null)
                  Tab(
                    icon: Text("Detail"),
                  ),
                ...displayController.displayLayout.tabs!
                    .map(
                      (e) => Tab(
                        icon: Text(e.title.enEN),
                      ),
                    )
                    .toList(),
                if (entityController.entity.display!.history!)
                  Tab(
                    icon: Text("History"),
                  ),
              ]),
            ),
            body: Obx(() {
              return TabBarView(controller: _tabController, children: [
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
                                          displayController.search(tab: e, keyword: val);
                                        },
                                        columns: displayController.searchModels[e.entity]!.entity.search!.columns,
                                        data: displayController.searchModels[e.entity]!.data,
                                        onPressed: (data) {},
                                      ),
                                    )
                                  : Container(),
                        ))
                    .toList(),
                if (entityController.entity.display!.history!)
                  Obx(() => HistoryListWidget(
                        histories: displayController.historyWorkflows,
                        onTap: (model) async {
                          print(model);
                          if ((model.formSchema ?? "").isNotEmpty) _showHistoryWidget(model);
                        },
                      )),
              ]);
            })),
      ),
    );
  }

  Widget getRenderWidget(TitleModel template) {
    // var t = json.decode(tmp);
    // return JsonWidgetData.fromDynamic(
    //   t,
    //   registry: registry,
    // )!
    //     .build(context: context);

    return Obx(() {
      var t = displayController.templates[template.enEN];
      return JsonWidgetData.fromDynamic(
        t,
        registry: registry,
      )!
          .build(context: context);
    });
  }

  String tmp = """

""";

  Future<void> _showHistoryWidget(HistoryModel data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: AlertDialog(
              actionsPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              content: FormioWidget(
                schema: data.formSchema ?? "",
              )),
        );
      },
    );
  }
}
