import 'package:admin/core/models/privilege.dart';
import 'package:get/get.dart';

class PrivilegeController extends GetxController {
  Rx<PrivilegeModel> _privilegeModel = PrivilegeModel.init().obs;
  PrivilegeModel get privilegeModel => _privilegeModel.value;

  set privilegeModel(PrivilegeModel p) {
    _privilegeModel.value = p;
  }
}
