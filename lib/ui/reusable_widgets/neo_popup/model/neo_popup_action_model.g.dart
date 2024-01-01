// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_popup_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoPopupActionModel _$NeoPopupActionModelFromJson(Map<String, dynamic> json) =>
    NeoPopupActionModel(
      transitionId: json['transitionId'] as String?,
      widgetEventKey: json['widgetEventKey'] as String?,
      labelText: json['labelText'] as String? ?? '',
      displayMode: $enumDecodeNullable(
              _$NeoButtonDisplayModeEnumMap, json['displayMode']) ??
          NeoButtonDisplayMode.primary,
    );

const _$NeoButtonDisplayModeEnumMap = {
  NeoButtonDisplayMode.primary: 'primary',
  NeoButtonDisplayMode.secondary: 'secondary',
  NeoButtonDisplayMode.line: 'line',
  NeoButtonDisplayMode.textBold: 'textBold',
  NeoButtonDisplayMode.textRegular: 'textRegular',
};
