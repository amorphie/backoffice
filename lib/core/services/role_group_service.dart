import 'package:admin/core/models/role_group.dart';

import '../export/_.dart';

mixin RoleGroupService {
  //Get

  Future<ResponseModel> getRoleGroupById({required String id}) async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.resource.getURl(
      "roleGroup/$id",
    ));
    return response;
  }

  Future<ResponseModel> getRoleGroup() async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.resource.getURl(
      "roleGroup",
    ));
    return response;
  }

  //Post

  Future<ResponseModel> postRoleGroup(RoleGroupModel model) async {
    ResponseModel response = await Executer.post(
        endpoint: BaseUrl.resource.getURl(
      "roleGroup",
    ));
    return response;
  }

  //Delete

  Future<ResponseModel> deleteRoleGroup(String id) async {
    ResponseModel response = await Executer.delete(
        endpoint: BaseUrl.resource.getURl(
      "roleGroup/$id",
    ));
    return response;
  }
}
