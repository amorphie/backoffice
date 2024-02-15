import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const String pathParameterCustomerName = "CUSTOMER_NAME";
}

class NeoCustomerNameWidgetNetworkManager {
  NeoCustomerNameWidgetNetworkManager({
    required this.endpointKey,
  });

  final String endpointKey;

  Future<NeoResponse> fetchCustomerName() async {
    try {
      final customerFullname = await NeoCoreSecureStorage().getCustomerNameAndSurname();
      if (customerFullname == null) {
        // TODO: Handle this case
        return NeoResponse.error(NeoError.defaultError());
      }

      final response = await GetIt.I<NeoNetworkManager>().call(
        NeoHttpCall(
          endpoint: endpointKey,
          pathParameters: {
            _Constants.pathParameterCustomerName: customerFullname,
          },
        ),
      );
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
