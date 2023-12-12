// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'workflow_instance_transition_model.dart';

part 'workflow_instance_model.g.dart';

@JsonSerializable()
class WorkflowInstanceModel {
  @JsonKey(name: "base-state", includeIfNull: false)
  String? baseState;
  String state;
  @JsonKey(name: "view-source", includeIfNull: false)
  String viewSource;
  List<WorkflowInstanceTransitionModel> transition;
  WorkflowInstanceModel({
    this.baseState,
    required this.state,
    required this.viewSource,
    required this.transition,
  });

  factory WorkflowInstanceModel.init() => WorkflowInstanceModel(state: "", viewSource: "", transition: []);

  factory WorkflowInstanceModel.fromJson(Map<String, dynamic> json) => _$WorkflowInstanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowInstanceModelToJson(this);
}
