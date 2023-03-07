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

  Future<ResponseModel> getPrivileges([int page = 0, int size = 100]) async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.resource.getURl(
      "privilege?page=$page&pageSize=$size",
    ));
    return response;
  }

  //Post

  Future<ResponseModel> postPrivilege(PrivilegeModel model) async {
    ResponseModel response = await Executer.post(
      endpoint: BaseUrl.resource.getURl(
        "privilege",
      ),
      data: {
        'status': model.status,
        'ttl': model.ttl,
      },
    );
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
