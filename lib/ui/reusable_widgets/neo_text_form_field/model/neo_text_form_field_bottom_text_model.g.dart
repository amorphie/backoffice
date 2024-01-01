// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_text_form_field_bottom_text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoTextFormFieldBottomTextModel _$NeoTextFormFieldBottomTextModelFromJson(
        Map<String, dynamic> json) =>
    NeoTextFormFieldBottomTextModel(
      messageType: $enumDecodeNullable(
          _$NeoTextFormFieldBottomTextMessageTypeEnumMap, json['messageType']),
      message: json['message'] as String?,
      iconUrn: json['iconUrn'] as String?,
    );

Map<String, dynamic> _$NeoTextFormFieldBottomTextModelToJson(
        NeoTextFormFieldBottomTextModel instance) =>
    <String, dynamic>{
      'messageType':
          _$NeoTextFormFieldBottomTextMessageTypeEnumMap[instance.messageType],
      'message': instance.message,
      'iconUrn': instance.iconUrn,
    };

const _$NeoTextFormFieldBottomTextMessageTypeEnumMap = {
  NeoTextFormFieldBottomTextMessageType.info: 'info',
  NeoTextFormFieldBottomTextMessageType.error: 'error',
  NeoTextFormFieldBottomTextMessageType.warning: 'warning',
};
