//import 'dart:ffi';

import 'dart:convert';

import 'package:admin/ui/controllers/menu_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/models/entity/entity_model.dart';
import '../../data/services/menu_services.dart';

class EntityController extends GetxController {
  Rx<EntityModel> _entity = EntityModel().obs;
  EntityModel get entity => _entity.value;
  set entity(EntityModel _) {
    _entity.value = _;
  }

  Map<String, EntityModel> entities = {};
  Map<String, dynamic> mocks = {};
  RxBool loading = false.obs;

  RxList<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[].obs;

  Future<void> init() async {
    MenuServices services = MenuServices();
    mocks = await services.getMockData();
    entities = await services.getEntityData();
  }

  Future<void> setEntityMenu() async {
    AppMenuController menu = Get.find<AppMenuController>();
    EntityModel? entityModel = entities[menu.menuItem.value.entity];
    if (entityModel != null) {
      entity = entityModel;
      await getUserList();
      await getDataList();
      await getTemplates();
    } else {
      Get.snackbar("Uyarı", "İsteğe uygun bir model bulunamadı");
    }
  }

  Future<void> getDataList() async {
    loading.value = true;
    AppMenuController menu = Get.find<AppMenuController>();

    await Future.delayed(Duration(seconds: 2));
    dataList.clear();
    var response = await http.get(Uri.parse(entity.search!.searchUrl));
    print(entity.search!.searchUrl);
    var data = mocks[menu.menuItem.value.entity];
    for (var item in data) {
      dataList.add(item);
    }
    loading.value = false;
  }

  Future<void> getUserList() async {
    //dataList.clear();
    var response = await http.get(Uri.parse('https://test-amorphie-fact-user.burgan.com.tr/user/search?page=0&pageSize=100'), headers: {
      // 'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    dynamic data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var item in data['data']) {
        userList.add(item);
      }

      print(userList);
    } else {
      throw Exception('Failed to fetch list');
    }
  }

  Map<String, String> templates = {};

  getTemplates() async {
    templates = {};
    for (var tab in entity.display!.tabs!) {
      if (tab.type == "render") {
        templates.addAll({tab.template!.trTR: await rootBundle.loadString("widgets/${tab.template!.trTR}.json")});
      }
    }
  }
}
