import 'package:admin/data/models/workflow/instance/workflow_instance_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_transition_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_view_model.dart';
import 'package:admin/data/models/workflow/transition_button_type.dart';
import 'package:admin/ui/helpers/exporter.dart';

import '_workflow_instance_controller.dart';

class WorkflowInstanceController extends GetxController with WorkflowInstanceControllerMixin {
  WorkflowInstanceController([String? _tag]) {
    setTag(_tag);
  }
  @override
  void onInit() {
    super.onInit();
    if (tag != null && tag!.isNotEmpty) setInstanceId(tag!);
  }

  Future hub(HubDataModel hubModel) async {
    assert(hubModel.instanceId.isNotEmpty);

    setInstanceId(hubModel.instanceId);
    await _getWorkflowInstanceTransition();

    if (model.viewSource == "transition") {
      await _getWorkflowInstanceData(); //TODO DATA HER TÜRLÜ BURADA BIND EDILECEK
      WorkflowInstanceTransitionModel? transitionModel = model.transition.firstWhereOrNull((element) => element.type == TransitionButtonType.forward || element.type == null);
      if (transitionModel != null) {
        setTransition(transitionModel);
        await _getWorkflowInstanceTransitionView();
        instanceDialog(Get.context!);
      }
    } else if (model.viewSource == "state") {
      await _getWorkflowInstanceData(); //TODO DATA HER TÜRLÜ BURADA BIND EDILECEK
    }
    printData();
  }

  Future back() async {
    if (backTransition != null) await postData(transition: backTransition!);
  }

  Future cancel() async {
    if (cancelTransition != null) await postData(transition: cancelTransition!);
  }

  Future initWithWorkflowName(String workflowName) async {
    //!Menüden + ya basınca ilk gelen transition için
    setWorkflowName(workflowName);
    setInstanceId(Uuid().v4());

    await _getWorkflowInstanceInit();
  }

  Future initWithInstanceId([String? instanceId]) async {
    //! Listeden bir detay açılırken o detayın datası gelsin diye
    await _getWorkflowInstanceTransition();
  }

  Future viewTransition(WorkflowInstanceTransitionModel t) async {
    //! Bir detay içerisinden transition seçilirse
    setTransition(t);
    await _getWorkflowInstanceTransitionView();
    instanceDialog(Get.context!, recordId: instanceId);
  }

  Future postData({WorkflowInstanceTransitionModel? transition, Map<String, dynamic>? entityData, String? instanceId}) async {
    if (this.instanceId.isEmpty) setInstanceId(instanceId ?? Uuid().v4());
    WorkflowInstanceTransitionModel t = transition ?? this.transition;
    //! eğer ki viewde gösterilen transitiona post atmak istenirse buraya transition null gönderilmelidir.
    if (t.requireData && entityData != null) setEntityData(entityData);

    await _postWorkflowInstance(t);
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

  Future _postWorkflowInstance(WorkflowInstanceTransitionModel transitionModel) async {
    assert(instanceId.isNotEmpty);
    assert(transitionModel.transition.isNotEmpty);
    ResponseModel response = await Services().postWorkflowInstance(instanceId, transitionModel.transition, entityData);
    if (response.success) {}
  }

  Future _getWorkflowInstanceTransition() async {
    assert(instanceId.isNotEmpty);
    ResponseModel response = await Services().getWorkflowInstanceTransition(instanceId);
    if (response.success) {
      model = WorkflowInstanceModel.fromJson(response.data);
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
