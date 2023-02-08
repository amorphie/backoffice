// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/controllers/app_controller.dart';
import 'package:get/get.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    AppController c = Get.put<AppController>(AppController());
    c.onInit();
  }
}
