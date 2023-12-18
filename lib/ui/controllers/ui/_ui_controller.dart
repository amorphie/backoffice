import 'package:admin/ui/helpers/exporter.dart';

mixin AppUiControllerMixin {
  Rx<MenuModel> _menu = MenuModel(items: []).obs;
  MenuModel get menu => _menu.value;
  // setMenu(MenuModel _) {
  //   _menu.value = _;
  // }

  Rx<MenuItemModel> _menuItem = MenuItemModel(type: MenuItemType.none).obs;
  MenuItemModel get menuItem => _menuItem.value;
  setMenuItemModel(MenuItemModel _) {
    _menuItem.value = _;
  }

  RxMap<String, dynamic> _dashboardListData = <String, dynamic>{}.obs;
  Map<String, dynamic> get dashboardListData => Map<String, dynamic>.of(_dashboardListData);
  setDashboardListData(Map<String, dynamic> _) {
    _dashboardListData.value = _;
  }

  Rx<DashboardModel> _dashboard = DashboardModel(items: []).obs;
  DashboardModel get dashboard => _dashboard.value;
  // setDashboard(DashboardModel _) {
  //   _dashboard.value = _;
  // }

  setUi(UIModel _) {
    _dashboard.value = _.dashboard;
    _menu.value = _.leftSidebar;
  }

  bool get isEntityItem => menuItem.type == MenuItemType.entity;
  bool get hasSelectedMenuItem => menuItem.type != MenuItemType.none;

  menuReset() {
    setMenuItemModel(MenuItemModel(type: MenuItemType.none));
  }
}
