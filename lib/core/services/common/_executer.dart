import 'dart:convert';

import 'package:admin/core/helpers/logger_helper.dart';
import "package:http/http.dart" as http;

import '../../export/_.dart';

class Executer {
  final Uri endpoint;
  final Map<String, dynamic>? data;
  final ResponseMethod method;

  Executer({
    required this.endpoint,
    this.data,
    required this.method,
  }) {
    _request = http.Request(method.name, endpoint);
    appLogger.wtf(data, endpoint, StackTrace.empty);
    _setData();
    _setHeaders();
  }
  //Map<String, String> _map = {};
  late http.Request _request;

  static Future<ResponseModel> get(
      {required Uri endpoint, Map<String, dynamic>? data}) async {
    Executer _e =
        Executer(endpoint: endpoint, data: data, method: ResponseMethod.GET);
    return await _e.execute();
  }

  static Future<ResponseModel> post(
      {required Uri endpoint, Map<String, dynamic>? data}) async {
    Executer _e =
        Executer(endpoint: endpoint, data: data, method: ResponseMethod.POST);
    return await _e.execute();
  }

  static Future<ResponseModel> delete(
      {required Uri endpoint, Map<String, dynamic>? data}) async {
    Executer _e =
        Executer(endpoint: endpoint, data: data, method: ResponseMethod.DELETE);
    return await _e.execute();
  }

  static Future<ResponseModel> patch(
      {required Uri endpoint, Map<String, dynamic>? data}) async {
    Executer _e =
        Executer(endpoint: endpoint, data: data, method: ResponseMethod.PATCH);
    return await _e.execute();
  }

  static Future<ResponseModel> put(
      {required Uri endpoint, Map<String, dynamic>? data}) async {
    Executer _e =
        Executer(endpoint: endpoint, data: data, method: ResponseMethod.PUT);
    return await _e.execute();
  }

  Future<ResponseModel> execute() async {
    if (ExecuterManager.control(endpoint.path, data, method)) {
      try {
        _setHeaders();
        http.StreamedResponse response = await _request.send();
        String resultData = await response.stream.bytesToString();
        var result = json.decode(resultData);

        if (response.statusCode >= 200 && response.statusCode < 300) {
          appLogger.v(
              "statusCode => " + response.statusCode.toString(), endpoint);

          return ResponseModel(
              code: response.statusCode,
              errors: {},
              success: true,
              message: "",
              data: result);
        } else {
          return ResponseModel(
              code: response.statusCode,
              success: false,
              errors: {},
              message: result["message"] ?? "",
              data: result);
        }
      } catch (e) {
        appLogger.e(e.toString(), endpoint);
        return ResponseModel(
            code: 0,
            success: false,
            errors: {"errors": e},
            message: e.toString(),
            data: null);
      }
    }
    return ResponseModel(
        code: 0,
        success: false,
        errors: {"errors": "responseTime"},
        message: "responseTime",
        data: null);
  }

  _setHeaders() {
    //TODO Set Headers
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer  ${Token.token}',
    };
    _request.headers.addAll(headers);
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
}
