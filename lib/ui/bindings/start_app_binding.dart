// ignore_for_file: unused_local_variable

import 'package:admin/ui/controllers/home_controller.dart';
import 'package:get/get.dart';

// import '../controllers/display_controller.dart';
import '../controllers/entity_controller.dart';
import '../controllers/menu_controller.dart';

class StartAppBinding extends Bindings {
  @override
  void dependencies() {
    AppMenuController appMenuController = Get.put<AppMenuController>(AppMenuController());
    EntityController entityController = Get.put<EntityController>(EntityController());
    HomeController homeController = Get.put<HomeController>(HomeController());
    // DisplayController displayController = Get.put<DisplayController>(DisplayController());
    // HomeController homeController = Get.put<HomeController>(HomeController());
  }
}
