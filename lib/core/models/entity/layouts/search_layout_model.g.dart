// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_layout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchLayout _$SearchLayoutFromJson(Map<String, dynamic> json) => SearchLayout(
      defaultPageSize: json['defaultPageSize'] as int? ?? 100,
      defaultPageNumber: json['defaultPageNumber'] as int? ?? 0,
      search: json['search'] as bool? ?? false,
      filter: (json['filter'] as List<dynamic>?)
          ?.map((e) => FilterLayout.fromJson(e as Map<String, dynamic>))
          .toList(),
      sort: json['sort'] == null
          ? null
          : SortLayoutModel.fromJson(json['sort'] as Map<String, dynamic>),
      columns: (json['columns'] as List<dynamic>)
          .map((e) => SearchColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      subDataField: json['subDataField'] as String?,
      endpointSuffix: json['endpointSuffix'] as bool?,
      url: json['url'] as String,
      titleTemplate: json['titleTemplate'] as String,
    );

Map<String, dynamic> _$SearchLayoutToJson(SearchLayout instance) =>
    <String, dynamic>{
      'defaultPageSize': instance.defaultPageSize,
      'defaultPageNumber': instance.defaultPageNumber,
      'search': instance.search,
      'filter': instance.filter,
      'columns': instance.columns,
      'subDataField': instance.subDataField,
      'endpointSuffix': instance.endpointSuffix,
      'url': instance.url,
      'titleTemplate': instance.titleTemplate,
      'sort': instance.sort,
    };
