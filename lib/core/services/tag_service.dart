import '../export/_.dart';

mixin TagService {
//Get

  Future<ResponseModel> getTag([int page = 0, int size = 100]) async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.resource.getURl(
      "tag?page=$page&pageSize=$size",
    ));

    return response;
  }

//Post

  Future<ResponseModel> postTag(TagModel model) async {
    ResponseModel response = await Executer.post(
        endpoint: BaseUrl.resource.getURl(
      "tag",
    ));
    return response;
  }

//Delete

  Future<ResponseModel> deleteTag(String tagName) async {
    ResponseModel response = await Executer.delete(
        endpoint: BaseUrl.resource.getURl(
      "tag/$tagName",
    ));
    return response;
  }
}
