// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../transition_type.dart';

part 'workflow_instance_transition_model.g.dart';

@JsonSerializable()
class WorkflowInstanceTransitionModel {
  String transition;
  @JsonKey(
    disallowNullValue: false,
    required: false,
    unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
  )
  TransitionType? type;
  @JsonKey(name: "require-data", includeIfNull: false)
  String? requireData;
  @JsonKey(name: "has-view-variant")
  bool hasViewVariant;
  WorkflowInstanceTransitionModel({
    required this.transition,
    this.type,
    this.requireData,
    required this.hasViewVariant,
  });

  factory WorkflowInstanceTransitionModel.fromJson(Map<String, dynamic> json) => _$WorkflowInstanceTransitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowInstanceTransitionModelToJson(this);
}
