// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_text_validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoTextValidationModel _$NeoTextValidationModelFromJson(
        Map<String, dynamic> json) =>
    NeoTextValidationModel(
      regex: json['regex'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$NeoTextValidationModelToJson(
        NeoTextValidationModel instance) =>
    <String, dynamic>{
      'regex': instance.regex,
      'message': instance.message,
    };
