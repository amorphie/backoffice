import 'package:admin/core/models/role.dart';
import 'package:get/get.dart';

import '../export/_.dart';

class RoleController extends GetxController {
  Rx<RoleModel> _roleModel = RoleModel.init().obs;
  RoleModel get role => _roleModel.value;
  RxList<RoleModel> roleList = RxList<RoleModel>.from([]);

  Services _services = Services();

  set role(RoleModel p) {
    _roleModel.value = p;
  }

  //Get

  Future<bool> getRoleById(String id) async {
    List<RoleModel> _list = [];

    ResponseModel response = await _services.getRoleById(id: id);

    if (response.success) {
      for (var item in response.data) {
        RoleModel model = RoleModel.fromMap(item);
        _list.add(model);
      }
      roleList.value = _list;
    }
    return response.success;
  }

  Future<bool> getRoles() async {
    List<RoleModel> _list = [];

    ResponseModel response = await _services.getRoles();

    if (response.success) {
      for (var item in response.data) {
        RoleModel model = RoleModel.fromMap(item);
        _list.add(model);
      }
      roleList.value = _list;
    }
    return response.success;
  }

  //Post

  Future<bool> addRole(RoleModel t) async {
    ResponseModel response = await _services.postRole(t);

    if (response.success) {
      roleList.add(RoleModel.fromMap(response.data));
    }
    return response.success;
  }

  //Delete

  Future<bool> deleteRole() async {
    ResponseModel response = await _services.deleteRole(role.id!);

    if (response.success) {
      roleList.removeWhere((e) => e.id == role.id);
    }
    return response.success;
  }
}
