// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardItemModel _$DashboardItemModelFromJson(Map<String, dynamic> json) =>
    DashboardItemModel(
      type: $enumDecode(_$DashboardTypeEnumMap, json['type']),
      entity: json['entity'] as String?,
      dataUrl: json['data-url'] as String?,
      data: json['data'] == null
          ? null
          : DashboardDataModel.fromJson(json['data'] as Map<String, dynamic>),
      title: json['title'] == null
          ? null
          : TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => DashboardItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int? ?? 5,
    );

Map<String, dynamic> _$DashboardItemModelToJson(DashboardItemModel instance) =>
    <String, dynamic>{
      'type': _$DashboardTypeEnumMap[instance.type]!,
      'entity': instance.entity,
      'data-url': instance.dataUrl,
      'data': instance.data,
      'title': instance.title,
      'items': instance.items,
      'count': instance.count,
    };

const _$DashboardTypeEnumMap = {
  DashboardType.counters: 'counters',
  DashboardType.chart: 'chart',
  DashboardType.tab: 'tab',
  DashboardType.list: 'list',
};
