// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_layout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterLayout _$FilterLayoutFromJson(Map<String, dynamic> json) => FilterLayout(
      data: json['data'] as String?,
      entity: json['entity'] as String,
      query: json['query'] as String,
      type: $enumDecode(_$FilterTypeEnumMap, json['type']),
      widget: $enumDecode(_$FilterWidgetEnumMap, json['widget']),
      title: TitleModel.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilterLayoutToJson(FilterLayout instance) =>
    <String, dynamic>{
      'data': instance.data,
      'entity': instance.entity,
      'query': instance.query,
      'type': _$FilterTypeEnumMap[instance.type]!,
      'widget': _$FilterWidgetEnumMap[instance.widget]!,
      'title': instance.title,
    };

const _$FilterTypeEnumMap = {
  FilterType.query: 'query',
  FilterType.reference: 'reference',
};

const _$FilterWidgetEnumMap = {
  FilterWidget.textField: 'textField',
  FilterWidget.dropdown: 'dropdown',
};
