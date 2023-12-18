import 'package:admin/data/models/workflow/instance/workflow_instance_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_transition_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_view_model.dart';
import 'package:admin/data/models/workflow/transition_button_type.dart';
import 'package:admin/ui/helpers/exporter.dart';

import '_workflow_instance_controller.dart';

class WorkflowInstanceController extends GetxController with WorkflowInstanceControllerMixin {
  Future hub(HubModel hubModel) async {
    assert(hubModel.instanceId.isNotEmpty);

    setInstanceId(hubModel.instanceId);
    await _getWorkflowInstanceTransition();
    if (model.viewSource == "transition") {
      await _getWorkflowInstanceData();
      await _getWorkflowInstanceTransition();
    }
    printData();
  }

  Future init({String? recordId, String? transitionName}) async {
    assert(recordId != null || transitionName != null);

    if (recordId != null) {
      setInstanceId(recordId);
      setTransitionName(transitionName!);
      await _getWorkflowInstanceTransition();
      if (model.viewSource == "transition") {
        await _getWorkflowInstanceData();
        await _getWorkflowInstanceTransitionView();
      }
    } else if (transitionName != null) {
      setTransitionName(transitionName);
      if (instanceId.isEmpty) setInstanceId(Uuid().v4());
      await _getWorkflowInstanceTransitionView();
    }
  }

  Future initWithWorkflowName(String workflowName) async {
    setWorkflowName(workflowName);
    if (instanceId.isEmpty) setInstanceId(Uuid().v4());

    await _getWorkflowInstanceInit();
  }

  Future postData({WorkflowInstanceTransitionModel? transition, required Map<String, dynamic> entityData, String? instanceId}) async {
    if (this.instanceId.isEmpty) setInstanceId(instanceId ?? Uuid().v4());
    if (transition != null) setTransition(transition);
    setEntityData(entityData);
    await _postWorkflowInstance();
  }

  Future _getWorkflowInstanceInit() async {
    assert(workflowName.isNotEmpty);
    ResponseModel response = await Services().getWorkflowInstanceInit(workflowName);
    if (response.success) {
      model = WorkflowInstanceModel.fromJson(response.data);
      if (model.viewSource == "transition") {
        WorkflowInstanceTransitionModel? transitionModel = model.transition.firstWhereOrNull((element) => element.type == TransitionButtonType.forward || element.type == null);
        if (transitionModel != null) {
          setTransition(transitionModel);
          await _getWorkflowInstanceTransitionView();
          instanceDialog(Get.context!);
        }
      }
    }
  }

  Future _getWorkflowInstanceTransitionView() async {
    assert(transitionName.isNotEmpty);
    ResponseModel response = await Services().getWorkflowInstanceTransitionView(transitionName);
    if (response.success) {
      view = WorkflowInstanceViewModel.fromJson(response.data);
    }
  }

  Future _getWorkflowInstanceStateView() async {
    assert(stateName.isNotEmpty);
    ResponseModel response = await Services().getWorkflowInstanceStateView(stateName);
    if (response.success) {
      view = WorkflowInstanceViewModel.fromJson(response.data);
    }
  }

  Future _postWorkflowInstance() async {
    assert(instanceId.isNotEmpty);
    assert(entityData.isNotEmpty);
    assert(transition.transition.isNotEmpty);
    ResponseModel response = await Services().postWorkflowInstance(instanceId, transition.transition, entityData);
    if (response.success) {}
  }

  Future _getWorkflowInstanceTransition() async {
    assert(instanceId.isNotEmpty);
    ResponseModel response = await Services().getWorkflowInstanceTransition(instanceId);
    if (response.success) {
      model = WorkflowInstanceModel.fromJson(response.data);
      if (model.viewSource == "transition") {
        WorkflowInstanceTransitionModel? transitionModel = model.transition.firstWhereOrNull((element) => element.type == TransitionButtonType.forward || element.type == null);
        if (transitionModel != null) {
          setTransition(transitionModel);
          await _getWorkflowInstanceTransitionView();
          instanceDialog(Get.context!);
        }
      }
    }
  }

  Future _getWorkflowInstanceData() async {
    assert(instanceId.isNotEmpty);
    ResponseModel response = await Services().getWorkflowInstanceData(instanceId);
    if (response.success) {
      if (response.data is String) {
        entityData = json.decode(response.data);
      } else {
        entityData = response.data;
      }
    }
  }

  Future<String?> getTemplate(String name, Map<String, dynamic> renderData) async {
    var data = {
      "name": name,
      "render-id": Uuid().v4(),
      "render-data": renderData,
      "render-data-for-log": renderData,
    };

    var response = await Services().getTemplate(data: data);

    if (response.success) {
      return response.data;
    }
    return null;
  }

  printData() {
    print(
        'WorkflowInstanceControllerMixin(_data: ${entityData.toString()} _model: ${model.toJson().toString()},\n _view: ${view.toJson().toString()},\n _transition: ${transition.toJson().toString()},\n _workflowName: $workflowName,\n _loading: $loading,\n _instanceId: $instanceId,\n _transitionName: $transitionName,\n _stateName: $stateName)');
  }
}
