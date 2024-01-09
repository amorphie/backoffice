// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_button_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoButtonDataModel _$NeoButtonDataModelFromJson(Map<String, dynamic> json) =>
    NeoButtonDataModel(
      transitionId: json['transitionId'] as String,
      labelText: json['labelText'] as String? ?? "",
      displayMode: $enumDecodeNullable(
              _$NeoButtonDisplayModeEnumMap, json['displayMode']) ??
          NeoButtonDisplayMode.textRegular,
    );

Map<String, dynamic> _$NeoButtonDataModelToJson(NeoButtonDataModel instance) =>
    <String, dynamic>{
      'transitionId': instance.transitionId,
      'labelText': instance.labelText,
      'displayMode': _$NeoButtonDisplayModeEnumMap[instance.displayMode]!,
    };

const _$NeoButtonDisplayModeEnumMap = {
  NeoButtonDisplayMode.primary: 'primary',
  NeoButtonDisplayMode.secondary: 'secondary',
  NeoButtonDisplayMode.line: 'line',
  NeoButtonDisplayMode.textBold: 'textBold',
  NeoButtonDisplayMode.textRegular: 'textRegular',
};
