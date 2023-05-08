import 'dart:convert';

import 'package:admin/data/models/workflow/altmodels/transitions.dart';
import 'package:admin/data/models/workflow/workflow_model.dart';
import 'package:admin/data/services/executer_service.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class WorkflowController extends GetxController {
  Uri _getUrl(String endpoint) => Uri.parse("https://test-amorphie-workflow.burgan.com.tr/" + endpoint);
  Rx<WorkflowModel> _workflow = WorkflowModel.init().obs;
  WorkflowModel get workflow => _workflow.value;
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

    var response = await Executer.get(
      endpoint: "https://test-amorphie-workflow.burgan.com.tr/workflow/consumer/${_entity.value}/record/${_recordId.value}/transition",
      headers: {
        "Accept": "application/json",
        "Accept-Language": "en-EN",
      },
    );
    _loading.value = false;
    if (response.success) {
      var result = response.data;
      workflow = WorkflowModel.fromMap(result["data"]);
    }
  }

  postTransition({required TransitionsModel transition, required Map<String, dynamic> entityData}) async {
    var data = {
      "entityData": entityData,
      "formData": {},
      "additionalData": {},
      "getSignalRHub": true,
      "routeData": {},
      "queryData": {},
    };
    var headers = {
      "User": "3ce87ad2-0a73-b9be-2999-b0d8188fa4cf",
      "Behalf-Of-User": "3ce87ad2-0a73-b9be-2999-b0d8188fa4cf",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var response = await Executer.post(
        endpoint: "https://test-amorphie-workflow.burgan.com.tr/workflow/consumer/${_entity.value}/record/${_recordId.value}/transition/${transition.name}", data: data, headers: headers);
    if (response.success) {
      var result = response.data;
      //TODO snackbar ile gösterim yapılacak
      await getTransitions();
    }
  }
}
