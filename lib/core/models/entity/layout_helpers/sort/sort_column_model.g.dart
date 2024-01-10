// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_column_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortColumnModel _$SortColumnModelFromJson(Map<String, dynamic> json) =>
    SortColumnModel(
      sortColumn: json['sortColumn'] as String,
      sortDirection: $enumDecode(_$SortDirectionEnumMap, json['sortDirection']),
    );

Map<String, dynamic> _$SortColumnModelToJson(SortColumnModel instance) =>
    <String, dynamic>{
      'sortColumn': instance.sortColumn,
      'sortDirection': _$SortDirectionEnumMap[instance.sortDirection]!,
    };

const _$SortDirectionEnumMap = {
  SortDirection.asc: 'asc',
  SortDirection.desc: 'desc',
};
