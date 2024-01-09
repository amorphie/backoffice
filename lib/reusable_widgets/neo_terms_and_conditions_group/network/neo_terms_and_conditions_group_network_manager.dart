/*
 * neo_bank
 *
 * Created on 28/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_terms_and_conditions_group/models/neo_terms_and_conditions_item_data.dart';
import 'package:neo_core/core/network/managers/neo_network_manager.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';

abstract class _Constants {
  static const endpointPostDocument = "post-document";
  static const headerAuthorization = "Authorization";
  static const headerAuthorizationValuePrefix = "Bearer ";
}

class NeoTermsAndConditionsGroupNetworkManager {
  Future<String> fetchPdfContentWithUrl(String pdfUrl) async {
    try {
      final response = await http.get(Uri.parse(pdfUrl));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body.substring(1, response.body.length - 1); // Response starts and ends with " character
      }
    } catch (e) {
      // No-op
    }
    return "";
  }

  Future<void> postDocumentReadStatus({
    required NeoTermsAndConditionsItemData itemData,
    required String token,
    required String fileContext,
  }) async {
    try {
      await GetIt.I<NeoNetworkManager>().call(
        NeoHttpCall(
          endpoint: _Constants.endpointPostDocument,
          headerParameters: {_Constants.headerAuthorization: _Constants.headerAuthorizationValuePrefix + token},
          body: itemData.copyWith(id: const Uuid().v1(), fileContext: fileContext).toJson(),
        ),
      );
    } catch (exception) {
      // No-op
    }
  }
}
