import 'package:admin/ui/controllers/ui/_ui_controller.dart';

import '../../helpers/exporter.dart';

class AppUiController extends GetxController with AppUiControllerMixin {
  Future setMenuItem(MenuItemModel _) async {
    setMenuItemModel(_);
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

  Future<void> init() async {
    Services services = Services();
    UIModel ui = await services.getUiData();
    setUi(ui);
    for (var d in dashboard.items) {
      await getDashboardListData(d);
    }
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
      }
    }
  }
}
