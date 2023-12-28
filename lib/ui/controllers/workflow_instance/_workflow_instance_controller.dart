// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/workflow/instance/workflow_instance_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_transition_model.dart';
import 'package:admin/data/models/workflow/instance/workflow_instance_view_model.dart';
import 'package:admin/data/models/workflow/transition_button_type.dart';

import '../../helpers/exporter.dart';

mixin WorkflowInstanceControllerMixin {
  //! model BEGIN
  Rx<WorkflowInstanceModel> _model = WorkflowInstanceModel.init().obs;
  WorkflowInstanceModel get model => _model.value;
  set model(WorkflowInstanceModel _) {
    _model.value = _;
    _stateName.value = _.state;
  }

  setModel(WorkflowInstanceModel _) {
    model = _;
  }
  //! model END

  //! view BEGIN
  Rx<WorkflowInstanceViewModel> _view = WorkflowInstanceViewModel.init().obs;
  WorkflowInstanceViewModel get view => _view.value;
  set view(WorkflowInstanceViewModel _) {
    _view.value = _;
  }

  setView(WorkflowInstanceViewModel _) {
    view = _;
  }
  //! view END

  //! transition BEGIN
  Rx<WorkflowInstanceTransitionModel> _transition = WorkflowInstanceTransitionModel.init().obs;
  WorkflowInstanceTransitionModel get transition => _transition.value;
  set transition(WorkflowInstanceTransitionModel _) {
    _transition.value = _;
    _transitionName.value = _.transition;
  }

  setTransition(WorkflowInstanceTransitionModel _) {
    transition = _;
  }

  WorkflowInstanceTransitionModel? get backTransition => model.transition.firstWhereOrNull((element) => element.type == TransitionButtonType.back);
  bool get hasBackTransition => backTransition != null;
  WorkflowInstanceTransitionModel? get cancelTransition => model.transition.firstWhereOrNull((element) => element.type == TransitionButtonType.cancel);
  bool get hasCancelTransition => cancelTransition != null;
  bool get hasMultiForwardTransition => model.transition.where((element) => element.type == TransitionButtonType.forward).length > 1;
  List<WorkflowInstanceTransitionModel> get forwardTransitions => model.transition.where((element) => element.type == TransitionButtonType.forward).toList();
  //! transition END

  //! workflowName BEGIN
  Rx<String> _workflowName = "".obs;
  String get workflowName => _workflowName.value;
  set workflowName(String _) {
    _workflowName.value = _;
  }

  setWorkflowName(String _) {
    workflowName = _;
  }
  //! workflowName END

  //! loading BEGIN
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool _) {
    _loading.value = _;
  }

  start() {
    loading = true;
  }

  end() {
    loading = false;
  }
  //! loading END

  //! instanceId BEGIN
  Rx<String> _instanceId = "".obs;
  String get instanceId => _instanceId.value;
  set instanceId(String _) {
    _instanceId.value = _;
  }

  setInstanceId(String _) {
    instanceId = _;
  }
  //! instanceId END

  //! transitionName BEGIN
  Rx<String> _transitionName = "".obs;
  String get transitionName => _transitionName.value;
  set transitionName(String _) {
    _transitionName.value = _;
  }

  setTransitionName(String _) {
    transitionName = _;
  }
  //! transitionName END

  //! stateName BEGIN
  Rx<String> _stateName = "".obs;
  String get stateName => _stateName.value;
  set stateName(String _) {
    _stateName.value = _;
  }

  setStateName(String _) {
    stateName = _;
  }
  //! stateName END

  //! entityData BEGIN
  RxMap<String, dynamic> _entityData = <String, dynamic>{}.obs;
  Map<String, dynamic> get entityData => Map<String, dynamic>.of(_entityData);
  set entityData(Map<String, dynamic> _) {
    _entityData.value = _;
  }

  setEntityData(Map<String, dynamic> _) {
    entityData = _;
  }

  String get getDataString => jsonEncode(entityData);
  //! entityData END
}
