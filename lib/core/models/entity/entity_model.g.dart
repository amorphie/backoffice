// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityModel _$EntityModelFromJson(Map<String, dynamic> json) => EntityModel(
      name: json['name'] as String,
      workflow:
          UIWorkflowModel.fromJson(json['workflow'] as Map<String, dynamic>),
      search: SearchLayout.fromJson(json['search'] as Map<String, dynamic>),
      display: json['display'] == null
          ? null
          : DisplayLayoutModel.fromJson(
              json['display'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EntityModelToJson(EntityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'workflow': instance.workflow,
      'search': instance.search,
      'display': instance.display,
    };
