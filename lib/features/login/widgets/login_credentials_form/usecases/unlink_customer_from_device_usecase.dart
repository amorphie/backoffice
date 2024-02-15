/*
 * neo_bank
 *
 * Created on 24/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const endpointUnlinkDevice = "unlink-device";
  static const queryParameterReference = "reference";
}

class UnlinkCustomerFromDeviceUseCase {
  Future<void> call() async {
    try {
      final customerId = await NeoCoreSecureStorage().getCustomerId();
      await getIt.get<NeoNetworkManager>().call(
            NeoHttpCall(
              endpoint: _Constants.endpointUnlinkDevice,
              queryProviders: [
                HttpQueryProvider({_Constants.queryParameterReference: customerId.orEmpty}),
              ],
            ),
          );
    } catch (e) {
      // No-op
    }
  }
}
