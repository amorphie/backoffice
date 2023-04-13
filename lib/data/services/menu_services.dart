// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/entity/entity_model.dart';
import 'package:admin/data/models/menu/menu_model.dart';
import 'package:flutter/services.dart';

class MenuServices {
  Future<Map<String, EntityModel>> getEntityData() async {
    Map<String, EntityModel> map = {};
    var result = await rootBundle.loadString("assets/entities.json");
    var data = json.decode(result);
    for (var item in data.keys) {
      map.addAll({item: EntityModel.fromMap(data[item])});
    }
    return map;
  }

  Future<Map<String, dynamic>> getMockData() async {
    var result = await rootBundle.loadString("assets/mocks.json");
    var data = json.decode(result);

    return data;
  }

  Future<MenuModel> getMenuData() async {
    var result = await rootBundle.loadString("assets/ui.json");
    var data = json.decode(result);

    MenuModel menu = MenuModel.fromMap(data);
    return menu;
  }
}
