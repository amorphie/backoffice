// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/workflow/transition_button_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workflow_instance_transition_model.g.dart';

@JsonSerializable()
class WorkflowInstanceTransitionModel {
  String transition;
  @JsonKey(
    disallowNullValue: false,
    required: false,
    unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
  )
  TransitionButtonType? type;
  @JsonKey(name: "require-data", includeIfNull: false)
  bool requireData;
  @JsonKey(name: "has-view-variant")
  bool hasViewVariant;
  WorkflowInstanceTransitionModel({
    required this.transition,
    this.type,
    this.requireData = true,
    required this.hasViewVariant,
  });

  factory WorkflowInstanceTransitionModel.init() => WorkflowInstanceTransitionModel(transition: "", hasViewVariant: false);

  factory WorkflowInstanceTransitionModel.fromJson(Map<String, dynamic> json) => _$WorkflowInstanceTransitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowInstanceTransitionModelToJson(this);
}
