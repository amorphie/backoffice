import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/menu_controller.dart';
import 'menu_item.dart';

class AppMenu extends StatelessWidget {
  AppMenu({super.key});
  final AppMenuController c = Get.find<AppMenuController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey[200],
      child: Column(
        children: [
          ...c.menu.value.items.map((e) => MenuItem(model: e)).toList(),
        ],
      ),
    );
  }
}
