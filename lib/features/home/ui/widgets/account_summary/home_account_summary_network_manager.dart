import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

class HomeAccountSummaryNetworkManager {
  Future<NeoResponse> fetchAccountSummaryComponentDetails(String iban) async {
    try {
      final response = await getIt.get<NeoNetworkManager>().call(
            NeoHttpCall(
              endpoint: 'account-summary',
              pathParameters: {"IBAN": iban},
              useHttps: false,
            ),
          );
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
