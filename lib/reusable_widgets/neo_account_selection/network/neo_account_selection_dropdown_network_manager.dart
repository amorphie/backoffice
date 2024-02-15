import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const String endpoint = "get-account-selection-list-for-debit";
}

class NeoAccountSelectionDropdownNetworkManager {
  Future<NeoResponse> fetchAccountList() async {
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
