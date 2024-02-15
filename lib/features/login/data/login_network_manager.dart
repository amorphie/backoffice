/*
 * 
 * Neobank.Client
 * 
 * Created on 28/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const String endpointRevokeToken = "revoke-token";
}

class LoginNetworkManager {
  Future<NeoResponse> tokenRevoke() async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(NeoHttpCall(endpoint: _Constants.endpointRevokeToken));
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      debugPrint("****Exception: ${exception.error}  $exception");
      return NeoResponse.error(exception.error);
    }
  }
}
