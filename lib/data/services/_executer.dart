import "package:http/http.dart" as http;

import '../../ui/helpers/exporter.dart';
//import 'package:logger/logger.dart' as appLogger;

class Executer {
  final String endpoint;
  final Map<String, dynamic>? data;
  final ResponseMethod method;
  final Map<String, String>? headers;

  Executer({
    required this.endpoint,
    this.data,
    this.headers,
    required this.method,
  }) {
    _request = http.Request(method.name, Uri.parse(endpoint));

    _setData();
    _setHeaders();
  }
  //Map<String, String> _map = {};
  late http.Request _request;

  static Future<ResponseModel> get({required String endpoint, Map<String, dynamic>? data, Map<String, String>? headers}) async {
    Executer _e = Executer(endpoint: endpoint, data: data, method: ResponseMethod.GET, headers: headers);
    return await _e.execute();
  }

  static Future<ResponseModel> post({required String endpoint, Map<String, dynamic>? data, Map<String, String>? headers}) async {
    Executer _e = Executer(endpoint: endpoint, data: data, method: ResponseMethod.POST, headers: headers);
    return await _e.execute();
  }

  static Future<ResponseModel> delete({required String endpoint, Map<String, dynamic>? data, Map<String, String>? headers}) async {
    Executer _e = Executer(endpoint: endpoint, data: data, method: ResponseMethod.DELETE, headers: headers);
    return await _e.execute();
  }

  static Future<ResponseModel> patch({required String endpoint, Map<String, dynamic>? data, Map<String, String>? headers}) async {
    Executer _e = Executer(endpoint: endpoint, data: data, method: ResponseMethod.PATCH, headers: headers);
    return await _e.execute();
  }

  static Future<ResponseModel> put({required String endpoint, Map<String, dynamic>? data, Map<String, String>? headers}) async {
    Executer _e = Executer(endpoint: endpoint, data: data, method: ResponseMethod.PUT, headers: headers);
    return await _e.execute();
  }

  Future<ResponseModel> execute() async {
    if (ExecuterManager.control(_endpointData(), data, method)) {
      try {
        _setHeaders();

        appLogger.wtf(data, "data", StackTrace.empty);
        appLogger.wtf(headers, "headers", StackTrace.empty);
        http.StreamedResponse response = await _request.send();
        String resultData = await response.stream.bytesToString();
        if (resultData.isEmpty) resultData = "{}";
        var result = jsonDecode(resultData);

        if (response.statusCode >= 200 && response.statusCode < 300) {
          appLogger.v(result, _endpointData(response.statusCode));

          return ResponseModel(code: response.statusCode, errors: {}, success: true, message: "", data: result);
        } else {
          appLogger.w(result, _endpointData(response.statusCode));

          return ResponseModel(code: response.statusCode, success: false, errors: {}, message: result["message"] ?? "", data: result);
        }
      } catch (e) {
        appLogger.e(e.toString(), _endpointData());
        return ResponseModel(code: 0, success: false, errors: {"errors": e}, message: e.toString(), data: null);
      }
    }
    return ResponseModel(code: 0, success: false, errors: {"errors": "responseTime"}, message: "responseTime", data: null);
  }

  _setHeaders() {
    var h = {
      // 'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer  ${Token.token}',

      // "Access-Control-Allow-Origin": "*",
      // "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    };
    _request.headers.addAll(headers ?? h);
  }

  _setData() {
    if (data != null) {
      // data!.forEach((key, value) {
      //  if (value != null) _map.addAll({key: value.toString()});
      //});
      //_request.bodyFields = _map;

      _request.body = json.encode(data);
    }
  }

  String _endpointData([int? statusCode, String? title]) => "${title != null ? "[" + title + "]" : ""} ${statusCode != null ? statusCode : ""} [${method.name}] ${endpoint}";
}
