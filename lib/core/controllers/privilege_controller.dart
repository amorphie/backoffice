import 'package:admin/core/models/privilege.dart';
import 'package:get/get.dart';

import '../export/_.dart';

class PrivilegeController extends GetxController {
  Rx<PrivilegeModel> _privilegeModel = PrivilegeModel.init().obs;
  PrivilegeModel get privilege => _privilegeModel.value;
  RxList<PrivilegeModel> privilegeList = RxList<PrivilegeModel>.from([]);

  Services _services = Services();

  set privilege(PrivilegeModel p) {
    _privilegeModel.value = p;
  }

  //Get

  Future<bool> getPrivileges() async {
    List<PrivilegeModel> _list = [];

    ResponseModel response = await _services.getPrivileges();

    if (response.success) {
      for (var item in response.data['data']) {
        PrivilegeModel model = PrivilegeModel.fromMap(item);
        _list.add(model);
      }
      privilegeList.value = _list;
    }
    return response.success;
  }

  Future<bool> getPrivilegeById(String id) async {
    List<PrivilegeModel> _list = [];

    ResponseModel response = await _services.getPrivilegeById(id: id);

    if (response.success) {
      for (var item in response.data) {
        PrivilegeModel model = PrivilegeModel.fromMap(item);
        _list.add(model);
      }
      privilegeList.value = _list;
    }
    return response.success;
  }

  //Post

  Future<bool> addPrivilege(PrivilegeModel t) async {
    ResponseModel response = await _services.postPrivilege(t);
    print(response.data);
    if (response.success) {
      privilegeList.add(PrivilegeModel.fromMap(response.data));
    }
    return response.success;
  }

  //Delete

  Future<bool> deletePrivilege() async {
    ResponseModel response = await _services.deletePrivilege(privilege.id!);

    if (response.success) {
      privilegeList.removeWhere((e) => e.id == privilege.id);
    }
    return response.success;
  }
}
