import 'package:admin/core/models/privilege.dart';

import '../export/_.dart';

mixin PrivilegeService {
//Get

  Future<ResponseModel> getPrivilege({required int id}) async {
    ResponseModel response = await Executer.get(endpoint: "privilege/$id");
    return response;
  }

  //Post

  Future<ResponseModel> postPrivilege(PrivilegeModel model) async {
    ResponseModel response =
        await Executer.post(endpoint: "privilege", data: model.toMap());
    return response;
  }

  //Delete

  Future<ResponseModel> deletePrivilege(int id) async {
    ResponseModel response = await Executer.delete(endpoint: "privilege/$id");
    return response;
  }
}
