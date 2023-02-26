import 'package:admin/core/models/role.dart';

import '../export/_.dart';

mixin RoleService {
  //Get

  Future<ResponseModel> getRoleById({required String id}) async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.resource.getURl(
      "role/$id",
    ));
    return response;
  }

  Future<ResponseModel> getRole() async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.resource.getURl(
      "role",
    ));
    return response;
  }

  //Post

  Future<ResponseModel> postRole(RoleModel model) async {
    ResponseModel response = await Executer.post(
        endpoint: BaseUrl.resource.getURl(
      "role",
    ));
    return response;
  }

  //Delete

  Future<ResponseModel> deleteRole(String id) async {
    ResponseModel response = await Executer.delete(
        endpoint: BaseUrl.resource.getURl(
      "role/$id",
    ));
    return response;
  }
}
