import 'package:admin/core/models/role_group.dart';

import '../export/_.dart';

mixin RoleService {
  //Get

  Future<ResponseModel> getRoleById({required int id}) async {
    ResponseModel response = await Executer.get(endpoint: "role/$id");
    return response;
  }

  Future<ResponseModel> getRole({required int id}) async {
    ResponseModel response = await Executer.get(endpoint: "role");
    return response;
  }

  //Post

  Future<ResponseModel> postRole(RoleGroupModel model) async {
    ResponseModel response =
        await Executer.post(endpoint: "role", data: model.toMap());
    return response;
  }

  //Delete

  Future<ResponseModel> deleteRole(int id) async {
    ResponseModel response = await Executer.delete(endpoint: "role/$id");
    return response;
  }
}
