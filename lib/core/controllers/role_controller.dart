import 'package:admin/core/models/role.dart';
import 'package:admin/core/models/tag.dart';
import 'package:get/get.dart';

class RoleController extends GetxController {
  Rx<RoleModel> _roleModel = RoleModel.init().obs;
  RoleModel get roleModel => _roleModel.value;

  set roleModel(RoleModel p) {
    _roleModel.value = p;
  }
}
