import '../export/_.dart';

mixin TagService {
//Get

  Future<ResponseModel> getTag([int page = 0, int size = 100]) async {
    ResponseModel response =
        await Executer.get(endpoint: 'tag?page=$page&pageSize=$size');
    return response;
  }

//Post

  Future<ResponseModel> postTag(TagModel model) async {
    ResponseModel response =
        await Executer.post(endpoint: "tag", data: model.toMap());
    return response;
  }

//Delete

  Future<ResponseModel> deleteTag(String tagName) async {
    ResponseModel response = await Executer.delete(endpoint: "tag/$tagName");
    return response;
  }
}
