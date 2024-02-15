/*
 * 
 * neo_bank
 * 
 * Created on 19/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const String endpoint = "get-address-list";
}

class NeoAddressSelectionDropdownNetworkManager {
  Future<NeoResponse> fetchAddressList() async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(
        NeoHttpCall(
          endpoint: _Constants.endpoint,
        ),
      );
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
