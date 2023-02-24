import '../export/_.dart';
import 'package:http/http.dart' as http;

class UserService {
  //Get

  Future<ResponseModel> getUsers([String reference = ""]) async {
    ResponseModel response = await Executer.get(endpoint: "user?Reference$reference=&page=0&pageSize=100");
    return response;
  }

  Future<ResponseModel> getUserEmail({required String mail}) async {
    ResponseModel response = await Executer.get(endpoint: "user/email/$mail");
    return response;
  }

  Future<ResponseModel> getUserPhone({required int countryCode, required int number, required int prefix}) async {
    ResponseModel response = await Executer.get(endpoint: "user/phone/countrycode/$countryCode/prefix/$prefix/number/$number");
    return response;
  }

  Future<ResponseModel> checkPassowrd({required String id, required String password}) async {
    ResponseModel response = await Executer.get(endpoint: "user/userId/$id/password/$password");
    return response;
  }

  //Post

  Future<ResponseModel> postUser(UserModel model) async {
    ResponseModel response = await Executer.post(endpoint: "user", data: model.toMap());
    return response;
  }

  Future<ResponseModel> updatePassword(UserModel model, {required String id}) async {
    ResponseModel response = await Executer.post(endpoint: "user/$id/updatePassword", data: model.toMap());
    return response;
  }

  Future<ResponseModel> updateEmail(UserModel model, {required String id}) async {
    ResponseModel response = await Executer.post(endpoint: "user/$id/updateEmail", data: model.toMap());
    return response;
  }

  Future<ResponseModel> updatePhone(UserModel model, {required String id}) async {
    ResponseModel response = await Executer.post(endpoint: "user/$id/updatePhone", data: model.toMap());
    return response;
  }

  //Delete

  Future<ResponseModel> deleteUser(int id) async {
    ResponseModel response = await Executer.delete(endpoint: "user/$id");
    return response;
  }
}
