// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_instance_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowInstanceViewModel _$WorkflowInstanceViewModelFromJson(
        Map<String, dynamic> json) =>
    WorkflowInstanceViewModel(
      name: json['name'] as String,
      type: json['type'] as String,
      language: json['language'] as String,
      navigation: json['navigation'] as String,
      data: json['data'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$WorkflowInstanceViewModelToJson(
        WorkflowInstanceViewModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'language': instance.language,
      'navigation': instance.navigation,
      'data': instance.data,
      'body': instance.body,
    };
