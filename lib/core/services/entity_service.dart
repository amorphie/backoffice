import '../export/_.dart';

mixin EntityService {
  //Get

  Future<ResponseModel> getEntityByName({required String name}) async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.tag.getURl(
      "getAllEntityData/$name",
    ));
    return response;
  }

  //Post

  Future<ResponseModel> saveEntity() async {
    ResponseModel response = await Executer.post(
        endpoint: BaseUrl.tag.getURl(
      "saveEntity",
    ));
    return response;
  }

  //Delete
}
