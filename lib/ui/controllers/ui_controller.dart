import '../../helpers/exporter.dart';

class AppUiController extends GetxController {
  Rx<MenuModel> menu = MenuModel(items: []).obs;
  Rx<MenuItemModel> menuItem = MenuItemModel(type: MenuItemType.none).obs;
  late UIModel ui;

  bool get isEntityItem => menuItem.value.type == MenuItemType.entity;
  bool get hasSelectedMenuItem => menuItem.value.type != MenuItemType.none;
  RxMap<String, dynamic> dashboardListData = <String, dynamic>{}.obs;

  Future setMenuItem(MenuItemModel _) async {
    menuItem.value = _;
    EntityController entityController = Get.find<EntityController>();
    HomeController homeController = Get.find<HomeController>();

    entityController.resetPageNumber();
    homeController.rowPerPageReset();
    entityController.setEntityMenu();
    homeController.deselectEntity();
    if (homeController.filterView) {
      homeController.filterClose();
    }
  }

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
