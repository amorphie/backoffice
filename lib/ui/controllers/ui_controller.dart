import 'package:admin/data/models/dashboard/dashboard_item_model.dart';
import 'package:admin/data/models/dashboard/dashboard_type.dart';
import 'package:admin/data/models/menu/enums/menu_item_type.dart';
import 'package:admin/data/models/menu/menu_item_model.dart';
import 'package:admin/data/models/ui/ui_model.dart';
import 'package:admin/data/services/services.dart';
import 'package:get/get.dart';

import '../../data/models/menu/menu_model.dart';

class AppUiController extends GetxController {
  Rx<MenuModel> menu = MenuModel(items: []).obs;
  Rx<MenuItemModel> menuItem = MenuItemModel(type: MenuItemType.none).obs;
  late UIModel ui;

  bool get isEntityItem => menuItem.value.type == MenuItemType.entity;
  bool get hasSelectedMenuItem => menuItem.value.type != MenuItemType.none;
  RxMap<String, dynamic> dashboardListData = <String, dynamic>{}.obs;

  menuReset() {
    menuItem.value = MenuItemModel(type: MenuItemType.none);
  }

  Future<void> init() async {
    Services services = Services();
    ui = await services.getUiData();
    for (var d in ui.dashboard.items) {
      await getDashboardListData(d);
    }
    menu.value = ui.leftSidebar;
  }

  Future getDashboardListData(DashboardItemModel item) async {
    if (item.items != null) {
      for (var i = 0; i < item.items!.length; i++) {
        await getDashboardListData(item.items![i]);
      }
    } else {
      if (item.type == DashboardType.list) {
        Services services = Services();
        var result = await services.search(url: item.dataUrl!, pageSize: item.count, pageNumber: 0);
        dashboardListData.addAll({item.entity!: result.data});
        dashboardListData.refresh();
      }
    }
  }
}
