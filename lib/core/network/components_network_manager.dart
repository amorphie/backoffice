import 'package:backoffice/core/core_widgets/neo_component_tree_builder/network/i_components_network_manager.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

class ComponentsNetworkManager implements IComponentsNetworkManager {
  @override
  Future<NeoResponse> fetchPageComponentsByPageId(String pageId) async {
    try {
      final response = await getIt.get<NeoNetworkManager>().call(
            NeoHttpCall(endpoint: 'components', pathParameters: {"PAGE_ID": pageId}),
          );
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
