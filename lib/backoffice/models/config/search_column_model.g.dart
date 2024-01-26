// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_column_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchColumn _$SearchColumnFromJson(Map<String, dynamic> json) => SearchColumn(
      data: json['data'] as String,
      title: Map<String, String>.from(json['title'] as Map),
      sort: json['sort'] as int,
    );

Map<String, dynamic> _$SearchColumnToJson(SearchColumn instance) =>
    <String, dynamic>{
      'data': instance.data,
      'title': instance.title,
      'sort': instance.sort,
    };
