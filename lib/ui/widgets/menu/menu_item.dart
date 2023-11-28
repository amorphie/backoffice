// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

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
                tilePadding: EdgeInsets.zero,
                backgroundColor: Colors.black12,
                collapsedBackgroundColor: KC.primary,
                childrenPadding: const EdgeInsets.only(left: 15, bottom: 10),
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
                    menuController.setMenuItem(model);
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
                  // menuController.menuReset();
                  Get.to(Scaffold(
                    body: RenderWidget(template: testRenderTemplateData),
                  ));
                },
              );
            case MenuItemType.divider:
              return Divider();
            case MenuItemType.query:
              return Obx(() {
                return MenuButtonCard(
                  text: model.title!.enEN,
                  onPressed: () {
                    menuController.setMenuItem(model);
                  },
                  isSelected: menuController.menuItem.value == model,
                );
              });
            default:
              return MenuButtonCard(text: model.title!.enEN);
          }
        }),
      ),
    );
  }
}
