// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_navigation_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoNavigationConfigModel _$NeoNavigationConfigModelFromJson(
        Map<String, dynamic> json) =>
    NeoNavigationConfigModel(
      columns: (json['columns'] as List<dynamic>)
          .map((e) => SearchColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      filters: (json['filters'] as List<dynamic>?)
          ?.map((e) => SearchFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NeoNavigationConfigModelToJson(
        NeoNavigationConfigModel instance) =>
    <String, dynamic>{
      'columns': instance.columns,
      'filters': instance.filters,
    };
