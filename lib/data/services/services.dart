import 'package:admin/ui/environment.dart';
import 'package:http/http.dart' as http;

import '../../ui/helpers/exporter.dart';

class Services {
  Future<String> getJson(String name) async {
    return await rootBundle.loadString("assets/$name.json");
  }

  Future<Map<String, EntityModel>> getEntityData() async {
    Map<String, EntityModel> map = {};
    var response = await http.get(Uri.parse((dotenv.env["FIREBASE_URL"] ?? "") + "/v2/${Environment.type.name.toString()}/entities.json"));
    var data = json.decode(response.body);
    // var response = await getJson("entities");
    // var data = json.decode(response);
    for (var item in data.keys) {
      map.addAll({item: EntityModel.fromMap(data[item])});
    }
    return map;
  }

  Future<UIModel> getUiData() async {
    var response = await http.get(Uri.parse((dotenv.env["FIREBASE_URL"] ?? "") + "/v2/${Environment.type.name.toString()}/ui.json"));
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
      endpoint: "https://test-amorphie-tag.${dotenv.env["PROJECT_HOST"]}/Tag/getTag/$name",
      headers: {'accept': '*/*'},
    );
  }

  Future<ResponseModel> getTemplate({required Map<String, dynamic> data}) async {
    return await Executer.post(
      endpoint: "https://test-template-engine.${dotenv.env["PROJECT_HOST"]}/Template/Render",
      data: data,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
  }

  Future<ResponseModel> getHistory({required String entity, required String recordId}) async {
    return await Executer.get(
      endpoint: "https://test-amorphie-workflow.${dotenv.env["PROJECT_HOST"]}/workflow/consumer/${entity}/record/${recordId}/history",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Accept-Language": "en-EN",
      },
    );
  }

  Future<ResponseModel> getTransitions({required String entity, required String recordId}) async {
    return await Executer.get(
      endpoint: "https://test-amorphie-workflow.${dotenv.env["PROJECT_HOST"]}/workflow/consumer/${entity}/record/${recordId}/transition",
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
      endpoint: "https://test-amorphie-workflow.${dotenv.env["PROJECT_HOST"]}/workflow/consumer/${entity}/record/${recordId}/transition/${transition}",
      data: data,
      headers: headers,
    );
  }
}
