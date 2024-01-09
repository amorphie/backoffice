// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_dropdown_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoDropdownDataModel _$NeoDropdownDataModelFromJson(
        Map<String, dynamic> json) =>
    NeoDropdownDataModel(
      dataKey: json['dataKey'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              NeoDropdownListTileData.fromJson(e as Map<String, dynamic>))
          .toList(),
      dropdownType: $enumDecode(_$NeoDropdownTypeEnumMap, json['dropdownType']),
    );

const _$NeoDropdownTypeEnumMap = {
  NeoDropdownType.securityQuestion: 'securityQuestion',
};
