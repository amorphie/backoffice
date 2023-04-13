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
    entities = await services.getEntityData();
  }

  Future<void> setEntityMenu() async {
    AppMenuController menu = Get.find<AppMenuController>();
    EntityModel? entityModel = entities[menu.menuItem.value.entity];
    if (entityModel != null) {
      entity = entityModel;
      await getDataList();
      await getTemplates();
    } else {
      Get.snackbar("Uyarı", "İsteğe uygun bir model bulunamadı");
    }
  }

  Future<void> getDataList() async {
    loading.value = true;

    await Future.delayed(Duration(seconds: 2));
    dataList.clear();
    var response = await http.get(Uri.parse(entity.search!.searchUrl + "?page=0&pageSize=100"), headers: {
      // 'Accept': 'application/json',
      'Content-Type': 'application/json'
    });
    dynamic data = jsonDecode(response.body);
    var list = data;
    if (data["data"] != null) {
      list = data["data"];
    }
    for (var item in list) {
      dataList.add(item);
    }
    loading.value = false;
  }

  Map<String, dynamic> templates = {};

  getTemplates() async {
    templates = {};
    // templates.addAll({entity.display!.summary_template!.trTR: await rootBundle.loadString("widgets/${entity.display!.summary_template!.trTR}.json")});

    for (var tab in entity.display!.tabs!) {
      if (tab.type == "render") {
        String data = await rootBundle.loadString("widgets/${tab.template!.trTR}.json");
        var template = jsonDecode(data);
        templates.addAll({tab.template!.trTR: template});
      }
    }
  }
}
