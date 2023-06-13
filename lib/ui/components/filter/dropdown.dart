// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/extension/string_extension.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:flutter/material.dart';

import 'package:admin/data/models/entity/layout_helpers/filter_layout_model.dart';
import 'package:get/get.dart';

import '../../controllers/filter_controller.dart';

class FilterDropdown extends StatelessWidget {
  final FilterLayout filter;
  final dynamic value;
  final Function(dynamic val) onSelected;
  FilterDropdown({
    Key? key,
    required this.filter,
    this.value,
    required this.onSelected,
  }) : super(key: key);
  final FilterController filterController = Get.find<FilterController>();
  final EntityController entityController = Get.find<EntityController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          filter.title.enEN,
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<dynamic>(
              isExpanded: true,
              value: value,
              items: filterController.filterDataList[filter.entity]!
                  .map((e) => DropdownMenuItem<dynamic>(
                      value: e,
                      child: Text(
                        entityController.entities[filter.entity]!.titleTemplate.templateWithData(e),
                      )))
                  .toList(),
              onChanged: (val) {
                onSelected(val);
              },
            ),
          ),
        ),
      ],
    );
  }
}
