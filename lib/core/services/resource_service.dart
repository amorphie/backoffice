import 'package:admin/core/models/resource.dart';

import '../export/_.dart';

mixin ResourceService {
  //Get

  Future<ResponseModel> getResourceById({required String id}) async {
    ResponseModel response = await Executer.get(endpoint: "resource/$id");
    return response;
  }

  Future<ResponseModel> getAllResources() async {
    ResponseModel response = await Executer.get(endpoint: "resource");
    return response;
  }

  //Post

  Future<ResponseModel> postResource(ResourceModel model) async {
    ResponseModel response = await Executer.post(endpoint: "resource", data: model.toMap());
    return response;
  }

  //Delete

  Future<ResponseModel> deleteResource(String id) async {
    ResponseModel response = await Executer.delete(endpoint: "resource/$id");
    return response;
  }
}
