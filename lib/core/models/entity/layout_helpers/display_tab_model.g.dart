// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_tab_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayTabModel _$DisplayTabModelFromJson(Map<String, dynamic> json) =>
    DisplayTabModel(
      type: $enumDecode(_$DisplayTabTypeEnumMap, json['type']),
      entity: json['entity'] as String?,
      order: json['order'] as int,
      id: json['id'] as String?,
      url: json['url'] as String?,
      template: json['template'] == null
          ? null
          : TitleModel.fromJson(json['template'] as Map<String, dynamic>),
      title: TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      source: json['source'] as String?,
      data: json['data'] as String?,
      layout: json['layout'] as String?,
      filter: json['filter'] as String?,
      filterValue: json['filter-value'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => DisplayTabModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DisplayTabModelToJson(DisplayTabModel instance) =>
    <String, dynamic>{
      'type': _$DisplayTabTypeEnumMap[instance.type]!,
      'entity': instance.entity,
      'order': instance.order,
      'id': instance.id,
      'url': instance.url,
      'template': instance.template,
      'title': instance.title,
      'source': instance.source,
      'data': instance.data,
      'layout': instance.layout,
      'filter': instance.filter,
      'filter-value': instance.filterValue,
      'items': instance.items,
    };

const _$DisplayTabTypeEnumMap = {
  DisplayTabType.none: 'none',
  DisplayTabType.render: 'render',
  DisplayTabType.search: 'search',
  DisplayTabType.formio: 'formio',
  DisplayTabType.html: 'html',
  DisplayTabType.url: 'url',
  DisplayTabType.image: 'image',
  DisplayTabType.pdf: 'pdf',
  DisplayTabType.splitRow: 'splitRow',
  DisplayTabType.splitColumn: 'splitColumn',
};
