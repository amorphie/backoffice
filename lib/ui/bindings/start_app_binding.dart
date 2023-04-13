import 'package:admin/ui/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/entity_controller.dart';
import '../controllers/menu_controller.dart';

class StartAppBinding extends Bindings {
  @override
  void dependencies() {
    AppMenuController appMenuController = Get.put<AppMenuController>(AppMenuController());
    EntityController entityController = Get.put<EntityController>(EntityController());
    HomeController homeController = Get.put<HomeController>(HomeController());
  }
}
