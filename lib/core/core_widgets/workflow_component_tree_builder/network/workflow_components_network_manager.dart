import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const endpointGetTransition = "get-page-response-from-workflow";
  static const pathParameterSource = "SOURCE";
  static const pathParameterPageId = "PAGE_ID";
}

class WorkflowComponentsNetworkManager {
  Future<NeoResponse> fetchPageComponents(String source, String pageId) async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(
        NeoHttpCall(
          endpoint: _Constants.endpointGetTransition,
          pathParameters: {
            _Constants.pathParameterSource: source,
            _Constants.pathParameterPageId: pageId,
          },
          queryProviders: [
            HttpQueryProvider({"type": "flutterwidget"}),
          ],
        ),
      );
      debugPrint('\n[WorkflowComponentsNetworkManager] Fetch Page Components Response: $response');
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
