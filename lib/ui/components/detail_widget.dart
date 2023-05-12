import 'package:admin/data/models/entity/layout_helpers/title_model.dart';
import 'package:admin/ui/controllers/menu_controller.dart';
import 'package:admin/ui/pages/user_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import '../../style/colors.dart';
import '../controllers/display_controller.dart';

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
  final DisplayController displayController = Get.find<DisplayController>();
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: displayController.tabCount, vsync: this);
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
            Row(
              children: [
                editButton(context, "State"),
                editButton(context, "Workflows"),
                editButton(context, "Reset Password"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded workflowTopTemp(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        child: Scaffold(
            backgroundColor: KC.background,
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: KC.primary,
              elevation: 1,
              title: getRenderWidget(
                  displayController.displayLayout.summary_template!),
              actions: [
                IconButton(
                    onPressed: () {
                      displayController.reset();
                    },
                    icon: Icon(Icons.close))
              ],
              bottom: TabBar(controller: _tabController, tabs: [
                if (displayController.displayLayout.detail_template != null)
                  Tab(
                    icon: Text("Detay"),
                  ),
                ...displayController.displayLayout.tabs!
                    .map(
                      (e) => Tab(
                        icon: Text(e.title.trTR),
                      ),
                    )
                    .toList()
              ]),
            ),
            body: TabBarView(controller: _tabController, children: [
              if (displayController.displayLayout.detail_template != null)
                getRenderWidget(
                    displayController.displayLayout.detail_template!),
              ...displayController.displayLayout.tabs!
                  .map((e) => Container(
                        child: e.type == "render"
                            ? getRenderWidget(e.template!)
                            : Container(),
                      ))
                  .toList()
            ])),
      ),
    );
  }

  Widget editButton(BuildContext context, String title) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: TextButton(
            onPressed: () {
              _showMyDialog();
            },
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(KC.primary),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0)),
            ),
          ),
        ),
      ),
    );
  }

  getRenderWidget(TitleModel template) {
    var t = displayController.templates[template.trTR];
    return JsonWidgetData.fromDynamic(
      t,
      registry: JsonWidgetRegistry.instance,
    )!
        .build(context: context);
  }

  Future<void> _showMyDialog() async {
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
              'Düzenle',
              style: TextStyle(color: KC.primary),
            ),
          ),
          content: UserEditPage(),
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
