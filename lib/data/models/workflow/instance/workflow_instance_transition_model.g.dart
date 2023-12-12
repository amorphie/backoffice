// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_instance_transition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowInstanceTransitionModel _$WorkflowInstanceTransitionModelFromJson(
        Map<String, dynamic> json) =>
    WorkflowInstanceTransitionModel(
      transition: json['transition'] as String,
      type: $enumDecodeNullable(_$TransitionTypeEnumMap, json['type'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      requireData: json['require-data'] as String?,
      hasViewVariant: json['has-view-variant'] as bool,
    );

Map<String, dynamic> _$WorkflowInstanceTransitionModelToJson(
    WorkflowInstanceTransitionModel instance) {
  final val = <String, dynamic>{
    'transition': instance.transition,
    'type': _$TransitionTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('require-data', instance.requireData);
  val['has-view-variant'] = instance.hasViewVariant;
  return val;
}

const _$TransitionTypeEnumMap = {
  TransitionType.formio: 'Formio',
  TransitionType.pageUrl: 'PageUrl',
  TransitionType.html: 'Html',
  TransitionType.flutterWidget: 'FlutterWidget',
};
