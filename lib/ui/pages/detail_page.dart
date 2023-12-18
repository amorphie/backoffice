// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../helpers/exporter.dart';

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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Column(
        children: [
          temp(context),
          DisplayTagList(
            id: widget.id,
          ),
          WorkflowArea(
            id: widget.id,
          ),
        ],
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
                    Tab(
                      icon: Text("Detail"),
                    ),
                    ...(displayController.displayLayout.tabs ?? [])
                        .map(
                          (e) => Tab(
                            icon: Text(e.title.print()),
                          ),
                        )
                        .toList(),
                    if (entity.workflow.history)
                      Tab(
                        icon: Text("History"),
                      ),
                  ]),
            ),
            body: Obx(() {
              return TabBarView(controller: _tabController, children: [
                displayController.displayLayout.detailTemplate != null
                    ? getRenderWidget(displayController.displayLayout.detailTemplate!)
                    : GenericDetailWidget(
                        entity: entity,
                        data: displayController.displayView,
                      ),
                ...(displayController.displayLayout.tabs ?? []).map((e) {
                  return DisplayTabItemWidget(
                    value: e,
                    id: widget.id,
                  );
                }).toList(),
                if (entity.workflow.history)
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
      var t = displayController.templates[template.print()];
      return RenderWidget(template: t);
    });
  }
}
