import 'package:admin/core/models/privilege.dart';

import '../export/_.dart';

mixin PrivilegeService {
//Get

  Future<ResponseModel> getPrivilegeById({required String id}) async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.resource.getURl(
      "privilege/$id",
    ));
    return response;
  }

  //Post

  Future<ResponseModel> postPrivilege(PrivilegeModel model) async {
    ResponseModel response = await Executer.post(
        endpoint: BaseUrl.resource.getURl(
      "privilege",
    ));
    return response;
  }

  //Delete

  Future<ResponseModel> deletePrivilege(String id) async {
    ResponseModel response = await Executer.delete(
        endpoint: BaseUrl.resource.getURl(
      "privilege/$id",
    ));
    return response;
  }
}
