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

  Future<ResponseModel> getRoleGroups([int page = 0, int size = 100]) async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.resource.getURl(
      "roleGroup?page=$page&pageSize=$size",
    ));
    return response;
  }

  //Post

  Future<ResponseModel> postRoleGroup(RoleGroupModel model) async {
    ResponseModel response = await Executer.post(
      endpoint: BaseUrl.resource.getURl(
        "roleGroup",
      ),
      data: model.toMap(),
    );
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
