// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_layout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortLayoutModel _$SortLayoutModelFromJson(Map<String, dynamic> json) =>
    SortLayoutModel(
      columns:
          (json['columns'] as List<dynamic>).map((e) => e as String).toList(),
      defaultData:
          SortColumnModel.fromJson(json['defaultData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SortLayoutModelToJson(SortLayoutModel instance) =>
    <String, dynamic>{
      'columns': instance.columns,
      'defaultData': instance.defaultData,
    };
