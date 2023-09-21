// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/menu/enums/menu_item_type.dart';
import 'package:admin/ui/style/colors.dart';
import 'package:admin/ui/widgets/menu/menu_button_card.dart';
import 'package:admin/ui/widgets/menu/profile.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:admin/ui/controllers/ui_controller.dart';
import 'package:admin/ui/controllers/workflow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/menu/menu_item_model.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel model;
  MenuItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AppUiController menuController = Get.find<AppUiController>();
  final EntityController entityController = Get.find<EntityController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Builder(builder: (context) {
          switch (model.type) {
            case MenuItemType.group:
              return ExpansionTile(
                backgroundColor: Colors.black12,
                collapsedBackgroundColor: KC.primary,
                childrenPadding: const EdgeInsets.only(left: 30, bottom: 10),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                iconColor: KC.secondary,
                collapsedIconColor: Colors.white70,
                title: MenuButtonCard(
                  text: model.title!.enEN,
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
                  text: model.title!.enEN,
                  onPressed: () {
                    menuController.menuItem.value = model;
                    entityController.setEntityMenu();
                  },
                  isSelected: menuController.menuItem.value == model,
                );
              });
            case MenuItemType.workflow:
              return Obx(() {
                return MenuButtonCard(
                  text: model.title!.enEN,
                  onPressed: () async {
                    WorkflowController workflowController = Get.put<WorkflowController>(WorkflowController());
                    await workflowController.startTransition(
                      entity: model.entity!,
                      // recordId: "cf0a00ce-b0e5-4f0e-8c31-7e35cd4d4f5a",
                    );
                    menuController.menuItem.value = model;
                  },
                  isSelected: menuController.menuItem.value == model,
                );
              });
            case MenuItemType.profile:
              return MenuProfileItem(
                logoPressed: () {
                  menuController.menuReset();
                },
              );
            case MenuItemType.divider:
              return Divider();
            default:
              return MenuButtonCard(text: model.title!.enEN);
          }
        }),
      ),
    );
  }
}
