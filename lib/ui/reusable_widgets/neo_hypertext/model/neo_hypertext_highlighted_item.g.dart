// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_hypertext_highlighted_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoHypertextHighlightedItem _$NeoHypertextHighlightedItemFromJson(
        Map<String, dynamic> json) =>
    NeoHypertextHighlightedItem(
      itemKey: json['itemKey'] as String,
      text: json['text'] as String,
      data: json['data'] as String,
      actionType: $enumDecodeNullable(
              _$NeoHypertextActionTypeEnumMap, json['actionType']) ??
          NeoHypertextActionType.webView,
    );

Map<String, dynamic> _$NeoHypertextHighlightedItemToJson(
        NeoHypertextHighlightedItem instance) =>
    <String, dynamic>{
      'itemKey': instance.itemKey,
      'text': instance.text,
      'data': instance.data,
      'actionType': _$NeoHypertextActionTypeEnumMap[instance.actionType]!,
    };

const _$NeoHypertextActionTypeEnumMap = {
  NeoHypertextActionType.webView: 'webView',
  NeoHypertextActionType.callNumber: 'callNumber',
  NeoHypertextActionType.deeplink: 'deeplink',
};
