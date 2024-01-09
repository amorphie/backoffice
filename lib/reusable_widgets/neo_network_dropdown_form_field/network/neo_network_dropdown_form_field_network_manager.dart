import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

class NeoNetworkDropdownFormFieldNetworkManager {
  Future<NeoResponse> fetchItemList(String endpoint) async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(NeoHttpCall(endpoint: endpoint));
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
