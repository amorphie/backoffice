import 'package:get_it/get_it.dart';
import 'package:neo_core/core/network/models/neo_http_call.dart';
import 'package:neo_core/neo_core.dart';

abstract class _Constants {
  static const stateViewEndpoint = "get-detail-view-data";
  static const workflowDataEndpoint = "get-workflow-instance-data";

  static const workflowViewJson = {"json": "0"};
  static const workflowViewFlutterWidgetType = {"type": "FlutterWidget"};

  static const workflowViewSource = "state";
  static const workflowViewSourceName = "SOURCE";
  static const workflowViewPageKeyName = "PAGE_ID";
  static const workflowDataInstanceIdName = "INSTANCE_ID";
}

class NeoDetailNetworkManager {
  Future<NeoResponse> getStateView(String stateName) async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(
        NeoHttpCall(
          endpoint: _Constants.stateViewEndpoint,
          queryProviders: [
            HttpQueryProvider(_Constants.workflowViewFlutterWidgetType),
            HttpQueryProvider(_Constants.workflowViewJson),
          ],
          pathParameters: {
            _Constants.workflowViewSourceName: _Constants.workflowViewSource,
            _Constants.workflowViewPageKeyName: stateName,
          },
        ),
      );
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }

  Future<NeoResponse> getWorkflowInstanceData(String instanceId, [String? dataField]) async {
    try {
      final response = await GetIt.I<NeoNetworkManager>().call(
        NeoHttpCall(
          endpoint: _Constants.workflowDataEndpoint,
          queryProviders: [
            if (dataField != null) HttpQueryProvider({dataField: "true"}),
          ],
          pathParameters: {
            _Constants.workflowDataInstanceIdName: instanceId,
          },
        ),
      );
      return NeoResponse.success(response);
    } on NeoException catch (exception) {
      return NeoResponse.error(exception.error);
    }
  }
}
