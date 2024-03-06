// ignore_for_file: unused_local_variable

// import '../controllers/display_controller.dart';

import '../environment.dart';
import '../helpers/exporter.dart';

class StartAppBinding extends Bindings {
  @override
  void dependencies() {
    Environment.init();
    AppUiController appMenuController = Get.put<AppUiController>(AppUiController());
    EntityController entityController = Get.put<EntityController>(EntityController());
    HomeController homeController = Get.put<HomeController>(HomeController());
    // DisplayController displayController = Get.put<DisplayController>(DisplayController());
    // HomeController homeController = Get.put<HomeController>(HomeController());
  }
}
