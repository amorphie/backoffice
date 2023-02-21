import 'package:admin/core/export/_.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel.init().obs;
  UserModel get user => _userModel.value;
  RxList<UserModel> userList = RxList<UserModel>.from([]);

  Services _services = Services();

  set userModel(UserModel p) {
    _userModel.value = p;
  }

  //Get

  Future<bool> getUsers() async {
    List<UserModel> _list = [];

    ResponseModel response = await _services.getUser();

    if (response.success) {
      for (var item in response.data) {
        UserModel model = UserModel.fromMap(item);
        _list.add(model);
      }
      userList.value = _list;
      // _list.firstWhereOrNull((element) => user.id == element.id);
    }
    return response.success;
  }

  Future<bool> getUserByEmail(String email) async {
    List<UserModel> _list = [];

    ResponseModel response = await _services.getUserEmail(mail: email);

    if (!response.success) {
      for (var item in response.data) {
        UserModel model = UserModel.fromMap(item);
        _list.add(model);
      }
      userList.value = _list;
    }
    return !response.success;
  }

  //Post

  Future<bool> addResource(UserModel t) async {
    ResponseModel response = await _services.postUser(t);

    if (!response.success) {
      userList.add(UserModel.fromMap(response.data));
    }
    return !response.success;
  }

  Future<bool> updatePassword(UserModel t) async {
    ResponseModel response = await _services.updatePassword(t, id: user.id);

    if (!response.success) {
      userList.add(UserModel.fromMap(response.data));
    }
    return !response.success;
  }

  Future<bool> updateEmail(UserModel t) async {
    ResponseModel response = await _services.updateEmail(t, id: user.id);

    if (!response.success) {
      userList.add(UserModel.fromMap(response.data));
    }
    return !response.success;
  }

  Future<bool> updatePhone(UserModel t) async {
    ResponseModel response = await _services.updatePhone(t, id: user.id);

    if (!response.success) {
      userList.add(UserModel.fromMap(response.data));
    }
    return !response.success;
  }

  //Delete

  Future<bool> deleteResource() async {
    ResponseModel response = await _services.deleteResource(user.id);

    if (!response.success) {
      userList.removeWhere((e) => e.id == user.id);
    }
    return !response.success;
  }
}
