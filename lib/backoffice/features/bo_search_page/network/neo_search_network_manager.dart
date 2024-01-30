import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const endpoint = "get-workflow-data";
  static const workflowNameQueryParameter = "workflowName";
  static const pageSizeQueryParameter = "pageSize";
  static const pageNumberQueryParameter = "page";
}

class NeoSearchNetworkManager {
  Future<NeoResponse> fetchItemList(String workflowName, [String? keyword]) async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(NeoHttpCall(endpoint: _Constants.endpoint, queryProviders: [
        HttpQueryProvider({_Constants.workflowNameQueryParameter: workflowName}),
        HttpQueryProvider({_Constants.pageSizeQueryParameter: "10"}),
        HttpQueryProvider({_Constants.pageNumberQueryParameter: "1"}),
        if (keyword != null) HttpQueryProvider({"keyword": keyword}),
      ]));
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
