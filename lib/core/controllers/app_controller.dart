// ignore_for_file: prefer_final_fields

import 'package:admin/core/controllers/resource_controller.dart';
import 'package:admin/core/controllers/tag_controller.dart';
import 'package:admin/core/controllers/user_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AppController extends GetxController {
  Rx<UserController> _user = UserController().obs;
  UserController get user => _user.value;
  Rx<TagController> _tag = TagController().obs;
  TagController get tag => _tag.value;
  Rx<ResourceController> _resource = ResourceController().obs;
  ResourceController get resource => _resource.value;

  Future init() async {}
}
