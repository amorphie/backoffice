import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/managers/neo_network_manager.dart';
import 'package:neo_core/core/network/models/neo_exception.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/core/network/models/neo_response.dart';

class _Constants {
  static const cardListEndpoint = 'get-card-list';
}

class NeoDebitCardListViewNetworkManager {
  Future<NeoResponse> fetchItemList() async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(NeoHttpCall(endpoint: _Constants.cardListEndpoint));
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
