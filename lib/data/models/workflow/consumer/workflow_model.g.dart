// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowModel _$WorkflowModelFromJson(Map<String, dynamic> json) =>
    WorkflowModel(
      stateManager: json['stateManager'] == null
          ? null
          : StateManager.fromJson(json['stateManager'] as Map<String, dynamic>),
      runningWorkflows: (json['runningWorkflows'] as List<dynamic>?)
          ?.map((e) => StateManager.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableWorkflows: (json['availableWorkflows'] as List<dynamic>?)
          ?.map((e) => StateManager.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkflowModelToJson(WorkflowModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stateManager', instance.stateManager);
  writeNotNull('runningWorkflows', instance.runningWorkflows);
  writeNotNull('availableWorkflows', instance.availableWorkflows);
  return val;
}
