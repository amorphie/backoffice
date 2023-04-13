// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/menu/enums/menu_item_type.dart';
import 'package:admin/ui/common/menu_button_card.dart';
import 'package:admin/ui/common/profile.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/menu/menu_item_model.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel model;
  MenuItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AppMenuController menuController = Get.find<AppMenuController>();
  final EntityController entityController = Get.find<EntityController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Builder(builder: (context) {
          switch (model.type) {
            case MenuItemType.group:
              return ExpansionTile(
                backgroundColor: Colors.grey[350],
                collapsedBackgroundColor: Colors.grey[350],
                childrenPadding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                collapsedTextColor: Colors.grey.withOpacity(0.3),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                iconColor: Colors.black,
                collapsedIconColor: Colors.black,
                title: MenuButtonCard(
                  text: model.title!.trTR,
                  isEspanded: false,
                ),
                children: model.items!
                    .map((e) => MenuItem(
                          model: e,
                        ))
                    .toList(),
              );
            case MenuItemType.entity:
              return Obx(() {
                return MenuButtonCard(
                  text: model.title!.trTR,
                  onPressed: () {
                    menuController.menuItem.value = model;
                    entityController.setEntityMenu();
                  },
                  isSelected: menuController.menuItem.value == model,
                );
              });
            case MenuItemType.profile:
              return MenuProfileItem();
            case MenuItemType.divider:
              return Divider();
            default:
              return MenuButtonCard(text: model.title!.trTR);
          }
        }),
      ),
    );
  }
}
