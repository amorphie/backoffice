// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_workflow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UIWorkflowModel _$UIWorkflowModelFromJson(Map<String, dynamic> json) =>
    UIWorkflowModel(
      entity: json['entity'] as String,
      name: json['name'] as String?,
      recordIdData: json['recordIdData'] as String? ?? "id",
      entityNameData: json['entityNameData'] as String?,
      firstTransition: json['firstTransition'] as String?,
      workflowNameData: json['workflowNameData'] as String?,
      history: json['history'] as bool? ?? true,
      stateManager: json['stateManager'] as bool? ?? true,
      runningWorkflows: json['runningWorkflows'] as bool? ?? true,
      availableWorkflows: json['availableWorkflows'] as bool? ?? true,
    );

Map<String, dynamic> _$UIWorkflowModelToJson(UIWorkflowModel instance) =>
    <String, dynamic>{
      'entity': instance.entity,
      'name': instance.name,
      'firstTransition': instance.firstTransition,
      'recordIdData': instance.recordIdData,
      'entityNameData': instance.entityNameData,
      'workflowNameData': instance.workflowNameData,
      'history': instance.history,
      'stateManager': instance.stateManager,
      'runningWorkflows': instance.runningWorkflows,
      'availableWorkflows': instance.availableWorkflows,
    };
