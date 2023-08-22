import 'package:admin/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/menu_controller.dart';
import 'menu_item.dart';

class AppMenu extends StatelessWidget {
  AppMenu({super.key});
  final AppMenuController c = Get.find<AppMenuController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      backgroundColor: KC.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/icons/burganlogo.png",
                    )),
                Icon(
                  Icons.language_outlined,
                  color: Colors.deepOrangeAccent,
                ),
                //  Text(
                //    "English",
                //    style: TextStyle(color: Colors.deepOrangeAccent),
                //  )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ...c.menu.value.items.map((e) => MenuItem(model: e)).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
