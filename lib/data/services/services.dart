import 'dart:convert';

import 'package:admin/data/models/entity/entity_model.dart';
import 'package:admin/data/models/menu/menu_model.dart';
import 'package:flutter/services.dart';

import 'common/response_model.dart';
import 'executer_service.dart';

class Services {
  Future<Map<String, EntityModel>> getEntityData() async {
    Map<String, EntityModel> map = {};
    var result = await rootBundle.loadString("assets/entities.json");
    var data = json.decode(result);
    for (var item in data.keys) {
      map.addAll({item: EntityModel.fromMap(data[item])});
    }
    return map;
  }

  Future<MenuModel> getMenuData() async {
    var result = await rootBundle.loadString("assets/ui.json");
    var data = json.decode(result);

    MenuModel menu = MenuModel.fromMap(data);
    return menu;
  }

  Future<ResponseModel> search({
    required String url,
    required int pageSize,
    required int pageNumber,
    String? searchText,
  }) async {
    String _url = url + "?pageSize=$pageSize&page=$pageNumber";
    if (searchText != null && searchText.length > 3) {
      _url += "&searchText=$searchText";
    }
    ResponseModel response = await Executer.get(
      endpoint: _url,
    );
    return response;
  }
}
