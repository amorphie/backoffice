import '../helpers/exporter.dart';

class WorkflowController extends GetxController {
  Rx<WorkflowModel> _workflow = WorkflowModel().obs;
  WorkflowModel get workflow => _workflow.value;

  String? _tag;
  WorkflowController([this._tag]);

  set workflow(WorkflowModel _) {
    _workflow.value = _;
  }

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  // Rx<TransitionsModel> _transition = TransitionsModel().obs;
  // TransitionsModel get transition => _transition.value;
  // set transition(TransitionsModel _) {
  //   _transition.value = _;
  // }

  RxString _entity = "".obs;
  RxString _recordId = "".obs;
  RxString _transition = "".obs;
  RxString _stateManager = "".obs;
  startTransition({required String entity, String? recordId, String? stateManager, String? transition}) async {
    _entity.value = entity;
    _recordId.value = recordId ?? Uuid().v4();
    _transition.value = transition ?? "";
    _stateManager.value = stateManager ?? "";
    await getTransitions();
  }

  StateManager? get selectedStateManager {
    StateManager? _sm;
    _sm = workflow.availableWorkflows?.firstWhereOrNull((element) => element.name == _stateManager.value);
    _sm = workflow.runningWorkflows?.firstWhereOrNull((element) => element.name == _stateManager.value);
    return _sm ?? workflow.stateManager;
  }

  TransitionModel? get selectedTransition {
    TransitionModel? _tm;
    _tm = selectedStateManager?.transitions?.firstWhereOrNull((element) => element.name == _transition.value);
    return _tm;
  }

  getTransitions() async {
    _loading.value = true;

    var response = await Services().getTransitions(
      entity: _entity.value,
      recordId: _recordId.value,
    );
    _loading.value = false;
    if (response.success) {
      var result = response.data;
      workflow = WorkflowModel.fromJson(result["data"]);
    }
  }

  Future postTransition({required TransitionModel transition, required Map<String, dynamic> entityData}) async {
    _loading.value = true;

    var data = {
      "entityData": entityData,
      "formData": {},
      "additionalData": {},
      "getSignalRHub": true,
      "routeData": {},
      "queryData": {},
    };
    var headers = {
      "User": Uuid().v4(),
      "Behalf-Of-User": Uuid().v4(),
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var response = await Services().postTransitions(
      entity: _entity.value,
      recordId: _recordId.value,
      transition: transition.name,
      data: data,
      headers: headers,
    );
    if (response.success) {
      if (_tag != null) {
        DisplayController displayController = Get.find<DisplayController>(tag: _tag);
        await displayController.detailTemplateRefresh();
        await displayController.getHistories();
        //  await displayController.getHistoryDetail();
      }
      // var result = response.data;
      if (_tag != null) {
        await getTransitions();
      }
    }
  }
}
