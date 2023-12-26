// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_instance_transition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowInstanceTransitionModel _$WorkflowInstanceTransitionModelFromJson(
        Map<String, dynamic> json) =>
    WorkflowInstanceTransitionModel(
      transition: json['transition'] as String,
      type: $enumDecodeNullable(_$TransitionButtonTypeEnumMap, json['type'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      requireData: json['require-data'] as bool? ?? true,
      hasViewVariant: json['has-view-variant'] as bool,
    );

Map<String, dynamic> _$WorkflowInstanceTransitionModelToJson(
        WorkflowInstanceTransitionModel instance) =>
    <String, dynamic>{
      'transition': instance.transition,
      'type': _$TransitionButtonTypeEnumMap[instance.type],
      'require-data': instance.requireData,
      'has-view-variant': instance.hasViewVariant,
    };

const _$TransitionButtonTypeEnumMap = {
  TransitionButtonType.forward: 'Forward',
  TransitionButtonType.back: 'Back',
  TransitionButtonType.cancel: 'Cancel',
};
