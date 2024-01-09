import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

class NeoNetworkDropdownFormFieldNetworkManager2 {
  Future<NeoResponse> fetchItemList(String endpoint) async {
    try {
      final a = await NeoCoreSecureStorage().getCustomerId() ?? "";
      debugPrint("customerid: $a");

      final response =
          await GetIt.I<NeoNetworkManager>().call(NeoHttpCall(endpoint: endpoint, pathParameters: {"CUSTOMER_ID": a}));
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
