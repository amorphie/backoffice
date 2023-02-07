import 'package:admin/core/export/_.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel.init().obs;
  UserModel get userModel => _userModel.value;

  set userModel(UserModel p) {
    _userModel.value = p;
  }

  // List<UserModel> _updatePost(List<UserModel> list, int ref, UserModel post) {
  //   List<UserModel> _list = List<UserModel>.from(list);
  //   int index = _list.indexWhere((element) => element.reference == ref);
  //   if (index > -1) {
  //     _list[index] = post;
  //   }
  //   return _list;
  // }

  // List<UserModel> _deletePost(List<UserModel> list, int ref) {
  //   List<UserModel> _list = List<UserModel>.from(list);
  //   int index = _list.indexWhere((element) => element.reference == ref);
  //   if (index > -1) {
  //     // _list[index].isDelete = true;
  //   }
  //   return _list;
  // }
}
