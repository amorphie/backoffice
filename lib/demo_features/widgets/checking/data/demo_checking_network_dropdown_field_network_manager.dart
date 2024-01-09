import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/managers/neo_network_manager.dart';
import 'package:neo_core/core/network/models/neo_error.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/core/network/models/neo_response.dart';
import 'package:neo_core/core/storage/neo_core_secure_storage.dart';

class DemoCheckingNetworkDropdownFieldNetworkManager {
  Future<NeoResponse> fetchInitialData(String endpoint) async {
    try {
      final cID = await NeoCoreSecureStorage().getCustomerId() ?? "";
      debugPrint("customerid: $cID");
      final response = await GetIt.I<NeoNetworkManager>()
          .call(NeoHttpCall(endpoint: endpoint, pathParameters: {"CUSTOMER_ID": cID}));
      return NeoResponse.success(response);
    } on Exception catch (exception) {
      debugPrint("****Exception: $exception");
      return NeoResponse.error(const NeoError(responseCode: '500'));
    }
  }
}
