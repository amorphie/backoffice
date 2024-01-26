// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter_dropdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFilterDropdown _$SearchFilterDropdownFromJson(
        Map<String, dynamic> json) =>
    SearchFilterDropdown(
      workflow: json['workflow'] as String,
      key: json['key'] as String,
      display: json['display'] as String,
      allowMultiSelect: json['allow-multi-select'] as bool,
    );

Map<String, dynamic> _$SearchFilterDropdownToJson(
        SearchFilterDropdown instance) =>
    <String, dynamic>{
      'workflow': instance.workflow,
      'key': instance.key,
      'display': instance.display,
      'allow-multi-select': instance.allowMultiSelect,
    };
