import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/managers/neo_network_manager.dart';
import 'package:neo_core/core/network/models/neo_exception.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/core/network/models/neo_response.dart';

class DropdownMaturityFieldNetworkManager {
  Future<NeoResponse> fetchInitialData(String endpoint) async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(NeoHttpCall(endpoint: endpoint));
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      debugPrint("****Exception: ${exception.error}  $exception");
      return NeoResponse.error(exception.error);
    }
  }
}
