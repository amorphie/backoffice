import 'package:admin/data/models/menu/enums/menu_item_type.dart';
import 'package:admin/data/models/menu/menu_item_model.dart';
import 'package:get/get.dart';

import '../../data/models/menu/menu_model.dart';
import '../../data/services/menu_services.dart';

class AppMenuController extends GetxController {
  Rx<MenuModel> menu = MenuModel(items: []).obs;
  Rx<MenuItemModel> menuItem = MenuItemModel(type: MenuItemType.none).obs;
  bool get hasSelectedMenuItem => menuItem.value.type != MenuItemType.none;
  Future<void> init() async {
    MenuServices services = MenuServices();
    menu.value = await services.getMenuData();
  }
}
