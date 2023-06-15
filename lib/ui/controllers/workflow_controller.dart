import 'package:admin/data/models/workflow/altmodels/transitions.dart';
import 'package:admin/data/models/workflow/workflow_model.dart';
import 'package:admin/data/services/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'display_controller.dart';

class WorkflowController extends GetxController {
  Rx<WorkflowModel> _workflow = WorkflowModel.init().obs;
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
  startTransition({required String entity, String? recordId}) async {
    _entity.value = entity;
    _recordId.value = recordId ?? Uuid().v4();
    await getTransitions();
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
      workflow = WorkflowModel.fromMap(result["data"]);
    }
  }

  Future postTransition({required TransitionsModel transition, required Map<String, dynamic> entityData}) async {
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
      transition: transition.name ?? "",
      data: data,
      headers: headers,
    );
    if (response.success) {
      if (_tag != null) {
        DisplayController displayController = Get.find<DisplayController>(tag: _tag);
        await displayController.detailTemplateRefresh();
      }
      // var result = response.data;
      //TODO snackbar ile gösterim yapılacak
      await getTransitions();
    }
  }
}
