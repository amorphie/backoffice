import 'package:admin/data/models/workflow/instance/workflow_instance_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_transition_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_view_model.dart';
import 'package:admin/ui/helpers/exporter.dart';

import '_workflow_instance_controller.dart';

class WorkflowInstanceController extends GetxController with WorkflowInstanceControllerMixin {
  Future initWithWorkflowName(String workflowName) async {
    setWorkflowName(workflowName);
    await _getWorkflowInstanceInit();
  }

  Future initWithInstanceId(String _) async {
    setInstanceId(instanceId);
    await _getWorkflowInstanceTransition();
  }

  Future viewTransition(String transitionName) async {
    setTransitionName(transitionName);
    await _getWorkflowInstanceTransitionView();
  }

  Future viewState(String stateName) async {
    setStateName(stateName);
    await _getWorkflowInstanceStateView();
  }

  Future getData() async {
    assert(instanceId.isNotEmpty);
    await _getWorkflowInstanceData();
  }

  Future getDataWithInstanceId(String _) async {
    setInstanceId(instanceId);
    await _getWorkflowInstanceData();
  }

  Future postData({required WorkflowInstanceTransitionModel transition, required Map<String, dynamic> entityData, String? instanceId}) async {
    if (this.instanceId.isNotEmpty) setInstanceId(instanceId ?? Uuid().v4());
    setTransition(transition);
    setEntityData(entityData);
    await _postWorkflowInstance();
  }

  Future _getWorkflowInstanceInit() async {
    ResponseModel response = await Services().getWorkflowInstanceInit(workflowName);
    if (response.success) {
      model = WorkflowInstanceModel.fromJson(response.data);
    }
  }

  Future _getWorkflowInstanceTransitionView() async {
    ResponseModel response = await Services().getWorkflowInstanceTransitionView(transitionName);
    if (response.success) {
      view = WorkflowInstanceViewModel.fromJson(response.data);
    }
  }

  Future _getWorkflowInstanceStateView() async {
    ResponseModel response = await Services().getWorkflowInstanceStateView(stateName);
    if (response.success) {
      view = WorkflowInstanceViewModel.fromJson(response.data);
    }
  }

  Future _postWorkflowInstance() async {
    ResponseModel response = await Services().postWorkflowInstance(instanceId, transition.transition, entityData);
    if (response.success) {}
  }

  Future _getWorkflowInstanceTransition() async {
    ResponseModel response = await Services().getWorkflowInstanceTransition(instanceId);
    if (response.success) {
      model = WorkflowInstanceModel.fromJson(response.data);
    }
  }

  Future _getWorkflowInstanceData() async {
    ResponseModel response = await Services().getWorkflowInstanceData(instanceId);
    if (response.success) {
      if (response.data is String) {
        entityData = json.decode(response.data);
      } else {
        entityData = response.data;
      }
    }
  }
}
