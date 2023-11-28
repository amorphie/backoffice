import 'dart:convert';

import 'package:admin/data/models/entity/entity_model.dart';
import 'package:admin/data/models/ui/ui_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import '_executer.dart';
import 'common/response_model.dart';

import 'package:http/http.dart' as http;

class Services {
  Future<String> getJson(String name) async {
    return await rootBundle.loadString("assets/$name.json");
  }

  Future<Map<String, EntityModel>> getEntityData() async {
    Map<String, EntityModel> map = {};
    var response = await http.get(Uri.parse(dotenv.env["ENTITIES_URL"] ?? ""));
    var data = json.decode(response.body);
    // var response = await getJson("entities");
    // var data = json.decode(response);
    for (var item in data.keys) {
      map.addAll({item: EntityModel.fromMap(data[item])});
    }
    return map;
  }

  Future<UIModel> getUiData() async {
    var response = await http.get(Uri.parse(dotenv.env["UI_URL"] ?? ""));
    var data = json.decode(response.body);

    // var response = await getJson("ui");
    // var data = json.decode(response);
    UIModel menu = UIModel.fromMap(data);
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
    ResponseModel response = await Executer.get(endpoint: _url, headers: {"Content-Type": "application/json", "Accept-Language": "en-EN", "Language": "en-EN"});
    return response;
  }

  Future<ResponseModel> getById(String url, String id) => Executer.get(endpoint: url + "/$id");

  Future<ResponseModel> getTag(String name) async {
    return await Executer.get(
      endpoint: "https://test-amorphie-tag.${dotenv.env["PROJECT_BASE_URL"]}/Tag/getTag/$name",
      headers: {'accept': '*/*'},
    );
  }

  Future<ResponseModel> getTemplate({required Map<String, dynamic> data}) async {
    return await Executer.post(
      endpoint: "https://test-template-engine.${dotenv.env["PROJECT_BASE_URL"]}/Template/Render",
      data: data,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
  }

  Future<ResponseModel> getHistory({required String entity, required String recordId}) async {
    return await Executer.get(
      endpoint: "https://test-amorphie-workflow.${dotenv.env["PROJECT_BASE_URL"]}/workflow/consumer/${entity}/record/${recordId}/history",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Accept-Language": "en-EN",
      },
    );
  }

  Future<ResponseModel> getTransitions({required String entity, required String recordId}) async {
    return await Executer.get(
      endpoint: "https://test-amorphie-workflow.${dotenv.env["PROJECT_BASE_URL"]}/workflow/consumer/${entity}/record/${recordId}/transition",
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
      endpoint: "https://test-amorphie-workflow.${dotenv.env["PROJECT_BASE_URL"]}/workflow/consumer/${entity}/record/${recordId}/transition/${transition}",
      data: data,
      headers: headers,
    );
  }
}
