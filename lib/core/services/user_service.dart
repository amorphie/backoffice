import '../export/_.dart';

mixin UserService {
  //Get

  Future<ResponseModel> getUser() async {
    ResponseModel response = await Executer.get(endpoint: "user");
    return response;
  }

  Future<ResponseModel> getUserEmail({required String mail}) async {
    ResponseModel response = await Executer.get(endpoint: "user/email/$mail");
    return response;
  }

  Future<ResponseModel> getUserPhone(
      {required int countryCode,
      required int number,
      required int prefix}) async {
    ResponseModel response = await Executer.get(
        endpoint:
            "user/phone/countrycode/$countryCode/prefix/$prefix/number/$number");
    return response;
  }

  Future<ResponseModel> checkPassowrd(
      {required int id, required String password}) async {
    ResponseModel response =
        await Executer.get(endpoint: "user/userId/$id/password/$password");
    return response;
  }

  //Post

  Future<ResponseModel> postUser(UserModel model) async {
    ResponseModel response =
        await Executer.post(endpoint: "user", data: model.toMap());
    return response;
  }

  Future<ResponseModel> updatePassword(UserModel model,
      {required int id}) async {
    ResponseModel response = await Executer.post(
        endpoint: "user/$id/updatePassword", data: model.toMap());
    return response;
  }

  Future<ResponseModel> updateEmail(UserModel model, {required int id}) async {
    ResponseModel response = await Executer.post(
        endpoint: "user/$id/updateEmail", data: model.toMap());
    return response;
  }

  Future<ResponseModel> updatePhone(UserModel model, {required int id}) async {
    ResponseModel response = await Executer.post(
        endpoint: "user/$id/updatePhone", data: model.toMap());
    return response;
  }

  //Delete

  Future<ResponseModel> deleteUser(int id) async {
    ResponseModel response = await Executer.delete(endpoint: "user/$id");
    return response;
  }
}
