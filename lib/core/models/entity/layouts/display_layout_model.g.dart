// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_layout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayLayoutModel _$DisplayLayoutModelFromJson(Map<String, dynamic> json) =>
    DisplayLayoutModel(
      summaryTemplate: json['summaryTemplate'] == null
          ? null
          : TitleModel.fromJson(
              json['summaryTemplate'] as Map<String, dynamic>),
      detailTemplate: json['detailTemplate'] == null
          ? null
          : TitleModel.fromJson(json['detailTemplate'] as Map<String, dynamic>),
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => DisplayTabModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DisplayLayoutModelToJson(DisplayLayoutModel instance) =>
    <String, dynamic>{
      'summaryTemplate': instance.summaryTemplate,
      'detailTemplate': instance.detailTemplate,
      'tabs': instance.tabs,
    };
