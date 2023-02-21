import '../export/_.dart';

mixin TagService {
//Get

  Future<ResponseModel> getTag() async {
    ResponseModel response = await Executer.get(endpoint: "userTag");
    return response;
  }

//Post

  Future<ResponseModel> postTag(TagModel model) async {
    ResponseModel response =
        await Executer.post(endpoint: "team-event", data: model.toMap());
    return response;
  }

//Delete

  Future<ResponseModel> deleteTag(int id) async {
    ResponseModel response = await Executer.delete(endpoint: "userTag/$id");
    return response;
  }
}
