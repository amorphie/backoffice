import 'dart:convert';

import 'package:admin/data/models/workflow/altmodels/transitions.dart';
import 'package:admin/data/models/workflow/workflow_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
    http.Response response = await http.get(_getUrl("workflow/consumer/${_entity.value}/record/${_recordId.value}/transition"), headers: {
      "Accept": "application/json",
      "Accept-Language": "en-EN",
    });
    _loading.value = false;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var result = json.decode(response.body);
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
    http.Response response =
        await http.post(_getUrl("workflow/consumer/${_entity.value}/record/${_recordId.value}/transition/${transition.name}"), body: json.encode(data), headers: headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var result = json.decode(response.body);
      //TODO snackbar ile gösterim yapılacak
      await getTransitions();
    }
  }
}
