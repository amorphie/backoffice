// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_instance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowInstanceModel _$WorkflowInstanceModelFromJson(
        Map<String, dynamic> json) =>
    WorkflowInstanceModel(
      baseState: json['base-state'] as String?,
      state: json['state'] as String,
      viewSource: json['view-source'] as String,
      transition: (json['transition'] as List<dynamic>)
          .map((e) => WorkflowInstanceTransitionModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkflowInstanceModelToJson(
    WorkflowInstanceModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('base-state', instance.baseState);
  val['state'] = instance.state;
  val['view-source'] = instance.viewSource;
  val['transition'] = instance.transition;
  return val;
}
