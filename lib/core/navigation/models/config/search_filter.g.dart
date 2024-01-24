// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFilter _$SearchFilterFromJson(Map<String, dynamic> json) => SearchFilter(
      title: Map<String, String>.from(json['title'] as Map),
      dropdown: json['dropdown'] == null
          ? null
          : SearchFilterDropdown.fromJson(
              json['dropdown'] as Map<String, dynamic>),
      filter: json['filter'] as String,
    );

Map<String, dynamic> _$SearchFilterToJson(SearchFilter instance) =>
    <String, dynamic>{
      'title': instance.title,
      'dropdown': instance.dropdown,
      'filter': instance.filter,
    };
