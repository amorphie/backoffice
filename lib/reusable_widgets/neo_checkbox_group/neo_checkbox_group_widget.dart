import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox/model/neo_checkbox_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox/neo_checkbox.dart';
import 'package:backoffice/util/constants/neo_dimens.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoCheckboxGroupWidget extends StatelessWidget {
  final List<NeoCheckboxItemModel> items;

  const NeoCheckboxGroupWidget({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        items.length,
        (index) => NeoCheckbox(
          itemModel: items[index],
          checkboxSpacing: NeoDimens.px12,
          padding: const EdgeInsetsDirectional.only(top: NeoDimens.px16),
        ),
      ),
    );
  }
}
