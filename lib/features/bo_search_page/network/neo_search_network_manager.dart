import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const endpoint = "post-document";
  static const workflowNameQueryParameter = "workflowName";
  static const pageSizeQueryParameter = "pageSize ";
  static const pageNumberQueryParameter = "page ";
}

class NeoSearchNetworkManager {
  Future<NeoResponse> fetchItemList(String workflowName) async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(NeoHttpCall(endpoint: _Constants.endpoint, queryProviders: [
        HttpQueryProvider({
          _Constants.workflowNameQueryParameter: workflowName,
          _Constants.pageSizeQueryParameter: "10",
          _Constants.pageNumberQueryParameter: "1",
        })
      ]));
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
