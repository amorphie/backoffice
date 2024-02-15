/*
 * 
 * neo_bank
 * 
 * Created on 26/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:get_it/get_it.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_key.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const String cardDetailsEndpoint = "get-card-details-by-card-number";
  static const String accountDetailsEndpoint = "get-account-details-by-iban";

  static const String pathParameterCardId = "CARD_ID";
  static const String pathParameterIban = "IBAN";
}

class NeoCardDetailsNetworkManager {
  Future<NeoResponse> fetchCardDetails() async {
    try {
      final cardId = GetIt.I<NeoParameterManager>().readFromCache(NeoParameterKey.debitCardIdCachedKey);
      final response = await GetIt.I<NeoNetworkManager>().call(
        NeoHttpCall(
          endpoint: _Constants.cardDetailsEndpoint,
          pathParameters: {
            _Constants.pathParameterCardId: cardId,
          },
        ),
      );
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }

  Future<NeoResponse> fetchAccountDetails(String iban) async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(
        NeoHttpCall(
          endpoint: _Constants.accountDetailsEndpoint,
          pathParameters: {
            _Constants.pathParameterIban: iban,
          },
        ),
      );
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
