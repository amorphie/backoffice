// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/entity/enums/filter_widget.dart';
import 'package:admin/ui/components/custom_textfield.dart';
import 'package:admin/ui/controllers/filter_controller.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/entity/layout_helpers/filter_layout_model.dart';
import 'package:get/get.dart';

import 'dropdown.dart';

class FilterItem extends StatelessWidget {
  final FilterLayout filter;
  FilterItem({
    Key? key,
    required this.filter,
  }) : super(key: key);
  final FilterController filterController = Get.find<FilterController>();

  @override
  Widget build(BuildContext context) {
    switch (filter.widget) {
      case FilterWidget.textField:
        return CustomTextField(
          label: filter.title.trTR,
          onChanged: (val) {
            if (val.isNotEmpty) {
              filterController.addFilter(filter, val);
            } else {
              filterController.removeFilter(filter);
            }
          },
        );
      case FilterWidget.dropdown:
        return Obx(() {
          String? filterQuery = filterController.filterQueryList[filter.data];
          var data = filterController.filterDataList[filter.data]!.firstWhereOrNull((element) => element["name"] == filterQuery);
          //TODO Şimdilik name alındı sonrasında değiştirilecek

          return FilterDropdown(
            filter: filter,
            value: data,
            onSelected: (val) {
              filterController.addFilter(filter, val["name"]);
              //TODO Şimdilik name alındı sonrasında değiştirilecek
            },
          );
        });
      default:
        return Container();
    }
  }
}
