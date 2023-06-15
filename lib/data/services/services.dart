import 'dart:convert';

import 'package:admin/data/models/entity/entity_model.dart';
import 'package:admin/data/models/menu/menu_model.dart';
import 'package:flutter/services.dart';

import '_executer.dart';
import 'common/response_model.dart';

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
    String? keyword,
    Map<String, String>? queries,
  }) async {
    String _url = url + "?pageSize=$pageSize&page=$pageNumber";
    if (keyword != null && keyword.length > 3) {
      _url += "&keyword=$keyword";
    }
    if (queries != null) {
      queries.forEach((key, value) {
        _url += "&$key=$value";
      });
    }
    ResponseModel response = await Executer.get(
      endpoint: _url,
    );
    return response;
  }

  Future<ResponseModel> getById(String url, String id) => Executer.get(endpoint: url + "/$id");

  Future<ResponseModel> getTemplate({required Map<String, dynamic> data}) async {
    return await Executer.post(
      endpoint: "https://test-template-engine.burgan.com.tr/Template/Render",
      data: data,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
  }

  Future<ResponseModel> getTransitions({required String entity, required String recordId}) async {
    return await Executer.get(
      endpoint: "https://test-amorphie-workflow.burgan.com.tr/workflow/consumer/${entity}/record/${recordId}/transition",
      headers: {
        "Accept": "application/json",
        "Accept-Language": "en-EN",
      },
    );
  }

  Future<ResponseModel> postTransitions({
    required String entity,
    required String recordId,
    required String transition,
    required Map<String, dynamic> data,
    required Map<String, String> headers,
  }) async {
    return await Executer.post(
      endpoint: "https://test-amorphie-workflow.burgan.com.tr/workflow/consumer/${entity}/record/${recordId}/transition/${transition}",
      data: data,
      headers: headers,
    );
  }
}
