import 'package:admin/core/models/role_group.dart';
import 'package:get/get.dart';

import '../export/_.dart';

class RoleGroupController extends GetxController {
  Rx<RoleGroupModel> _roleModel = RoleGroupModel.init().obs;
  RoleGroupModel get roleGroup => _roleModel.value;
  RxList<RoleGroupModel> roleGroupList = RxList<RoleGroupModel>.from([]);

  Services _services = Services();

  set roleGroup(RoleGroupModel p) {
    _roleModel.value = p;
  }

  //Get

  Future<bool> getRoleGroupById(String id) async {
    List<RoleGroupModel> _list = [];

    ResponseModel response = await _services.getRoleGroupById(id: id);

    if (response.success) {
      for (var item in response.data) {
        RoleGroupModel model = RoleGroupModel.fromMap(item);
        _list.add(model);
      }
      roleGroupList.value = _list;
    }
    return response.success;
  }

  Future<bool> getRoleGroups() async {
    List<RoleGroupModel> _list = [];

    ResponseModel response = await _services.getRoleGroups();

    if (response.success) {
      for (var item in response.data['data']) {
        RoleGroupModel model = RoleGroupModel.fromMap(item);
        _list.add(model);
      }
      roleGroupList.value = _list;
    }
    return response.success;
  }

  //Post

  Future<bool> addResource(RoleGroupModel t) async {
    ResponseModel response = await _services.postRoleGroup(t);

    if (response.success) {
      roleGroupList.add(RoleGroupModel.fromMap(response.data));
    }
    return response.success;
  }

  //Delete

  Future<bool> deleteResource() async {
    ResponseModel response = await _services.deleteRoleGroup(roleGroup.id!);

    if (response.success) {
      roleGroupList.removeWhere((e) => e.id == roleGroup.id);
    }
    return response.success;
  }
}
