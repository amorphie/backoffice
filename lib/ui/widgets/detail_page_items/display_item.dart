// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/entity/enums/display_tab_type.dart';
import 'package:admin/ui/controllers/display_controller.dart';
import 'package:admin/ui/controllers/home_controller.dart';
import 'package:admin/ui/widgets/formio/formio_test_json.dart';
import 'package:admin/ui/widgets/formio/formio_widget.dart';
import 'package:admin/ui/widgets/pdf/pdf.dart';
import 'package:admin/ui/widgets/render/render_widget.dart';
import 'package:admin/ui/widgets/tab_data_table/app_data_table/tab_data_table.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/entity/layout_helpers/display_tab_model.dart';
import 'package:get/get.dart';

class DisplayTabItemWidget extends StatelessWidget {
  final DisplayTabModel value;
  const DisplayTabItemWidget({
    Key? key,
    required this.value,
  }) : super(key: key);
  HomeController get homeController => Get.find<HomeController>();

  DisplayController get displayController => Get.find<DisplayController>(tag: homeController.selectedEntity.value.data["id"]);

  @override
  Widget build(BuildContext context) {
    switch (value.type) {
      case DisplayTabType.render:
        return Obx(() {
          var t = displayController.templates[value.template!.enEN];
          return RenderWidget(template: t);
        });
      case DisplayTabType.search:
        return Obx(
          () => TabDataTable(
            withSearch: displayController.searchModels[value.entity]!.entity.search!.search,
            onSearch: (val) {
              displayController.search(tab: value, keyword: val);
            },
            columns: displayController.searchModels[value.entity]!.entity.search!.columns,
            data: displayController.searchModels[value.entity]!.data,
            onPressed: (data) {},
          ),
        );
      case DisplayTabType.splitRow:
        return Row(
          children: value.items!
              .map(
                (e) => Expanded(
                  child: splitItem(e),
                ),
              )
              .toList(),
        );
      case DisplayTabType.splitColumn:
        return Column(
          children: value.items!
              .map(
                (e) => Expanded(
                  child: splitItem(e),
                ),
              )
              .toList(),
        );
      case DisplayTabType.formio:
        return FormioWidget(
          schema: formioTestJson,
          withBackButton: false,
        );
      case DisplayTabType.pdf:
        return PdfWidget();
      default:
        return Container();
    }
  }

  Widget splitItem(DisplayTabModel item) {
    if (item.type.isSplit) return DisplayTabItemWidget(value: item);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
          color: Colors.grey[200]),
      margin: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Text(item.title.trTR),
          Divider(),
          Expanded(child: DisplayTabItemWidget(value: item)),
        ],
      ),
    );
  }
}
