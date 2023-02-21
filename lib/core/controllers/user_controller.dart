import 'package:admin/core/export/_.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel.init().obs;
  UserModel get userModel => _userModel.value;

  set userModel(UserModel p) {
    _userModel.value = p;
  }
}
