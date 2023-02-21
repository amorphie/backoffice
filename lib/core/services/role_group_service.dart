import 'package:admin/core/models/role_group.dart';

import '../export/_.dart';

mixin RoleGroupService {
  //Get

  Future<ResponseModel> getRoleGroupById({required int id}) async {
    ResponseModel response = await Executer.get(endpoint: "roleGroup/$id");
    return response;
  }

  Future<ResponseModel> getRoleGroup({required int id}) async {
    ResponseModel response = await Executer.get(endpoint: "roleGroup");
    return response;
  }

  //Post

  Future<ResponseModel> postRoleGroup(RoleGroupModel model) async {
    ResponseModel response =
        await Executer.post(endpoint: "roleGroup", data: model.toMap());
    return response;
  }

  //Delete

  Future<ResponseModel> deleteRoleGroup(int id) async {
    ResponseModel response = await Executer.delete(endpoint: "roleGroup/$id");
    return response;
  }
}
