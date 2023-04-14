import 'package:admin/data/models/entity/layout_helpers/title_model.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/home_controller.dart';
import 'package:admin/ui/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import '../../style/colors.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final AppMenuController menuController = Get.find<AppMenuController>();
  final EntityController entityController = Get.find<EntityController>();
  final HomeController homeController = Get.find<HomeController>();
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: entityController.entity.display!.tabs!.length, vsync: this);
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          children: [
            workflowTopTemp(context),
            workflowBottomTemp(context, dropdownValue),
          ],
        ),
      ),
    );
  }

  Expanded workflowTopTemp(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Scaffold(
            backgroundColor: KC.background,
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: KC.primary,
              elevation: 1,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.accessibility),
                      SizedBox(width: 10),
                      Text(
                        "fullName",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Text(
                        "Tags : tags",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // tagPopUp(context);
                        },
                        child: Icon(
                          Icons.edit,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      homeController.reset();
                    },
                    icon: Icon(Icons.close))
              ],
              bottom: TabBar(
                  controller: _tabController,
                  tabs: entityController.entity.display!.tabs!
                      .map(
                        (e) => Tab(
                          icon: Text(e.title.trTR),
                        ),
                      )
                      .toList()),
            ),
            body: TabBarView(
                controller: _tabController,
                children: entityController.entity.display!.tabs!
                    .map((e) => Container(
                          child: e.type == "render"
                              ? getRenderWidget(e.template!)
                              : Container(),
                        ))
                    .toList())),
      ),
    );
  }

  Expanded workflowBottomTemp(BuildContext context, String dropdownValue) {
    return Expanded(
      flex: 2,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              workflowWidgets(dropdownValue, "State"),
              workflowWidgets(dropdownValue, "Reset password progress"),
              workflowWidgets(dropdownValue, "Available workflows"),
            ],
          ),
        ),
      ),
    );
  }

  Row workflowWidgets(String dropdownValue, String title) {
    return Row(
      children: [
        Text(
          "$title : ",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black87, fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          elevation: 1,
          style: TextStyle(color: Colors.black87),
          underline: Container(
            height: 2,
            color: KC.primary,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }

  getRenderWidget(TitleModel template) {
    var t = entityController.templates[template.trTR];
    return JsonWidgetData.fromDynamic(
      t,
      registry: JsonWidgetRegistry.instance,
    )!
        .build(context: context);
  }
}
