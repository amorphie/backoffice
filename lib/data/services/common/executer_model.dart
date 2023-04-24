import 'package:flutter/foundation.dart';

import '../service_config.dart';

enum ResponseMethod { POST, PATCH, DELETE, GET, PUT }

class ExecuterManager {
  static List<ExecuterModel> list = [];
  static bool control(
    String endpoint,
    Map<String, dynamic>? data,
    ResponseMethod method,
  ) {
    list.removeWhere((element) => element.isBeforeNow);
    ExecuterModel model =
        ExecuterModel(endpoint: endpoint, data: data, method: method);
    if (list.contains(model)) {
      print("responseTimeOverflow");
      return false;
    } else {
      list.add(model);
      return true;
    }
  }
}

class ExecuterModel {
  String endpoint;
  Map<String, dynamic>? data;
  ResponseMethod method;
  late DateTime time;
  ExecuterModel({
    required this.endpoint,
    this.data,
    required this.method,
  }) {
    time = DateTime.now();
  }

  bool get isBeforeNow =>
      time.add(ServiceConfig.responseTime).isBefore(DateTime.now());

  @override
  bool operator ==(covariant ExecuterModel other) {
    if (identical(this, other)) return true;

    return other.endpoint == endpoint &&
        mapEquals(other.data, data) &&
        other.method == method;
  }

  @override
  int get hashCode => endpoint.hashCode ^ data.hashCode ^ method.hashCode;

  @override
  String toString() {
    return 'ExecuterModel(endpoint: $endpoint, data: $data, method: $method, time: $time)';
  }
}
