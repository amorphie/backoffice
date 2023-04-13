import 'dart:convert';

import 'package:get/get.dart';

import '../models/user/user_model.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  Rx<UserModel> _user = UserModel.init().obs;
  UserModel get user => _user.value;
  RxList<UserModel> userList = RxList<UserModel>.from([]);
  set user(UserModel _) {
    _user.value = _;
  }

  Future<List<UserModel>> getUsers() async {
    List<UserModel> myList = [];

    final response = await http.get(
        Uri.parse(
            'https://test-amorphie-fact-user.burgan.com.tr/user/search?page=0&pageSize=100'),
        headers: {
          // 'Accept': 'application/json',
          'Content-Type': 'application/json'
        });

    dynamic data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var item in data['data']) {
        UserModel model = UserModel.fromMap(item);
        myList.add(model);
        userList.value = myList;
      }

      print(myList);
      return myList;
    } else {
      throw Exception('Failed to fetch list');
    }
  }
}
