// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_stepper_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoStepperItemModel _$NeoStepperItemModelFromJson(Map<String, dynamic> json) =>
    NeoStepperItemModel(
      isSelected: json['isSelected'] as bool,
      iconUrn: json['iconUrn'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      datetime: json['datetime'] as String?,
    );

Map<String, dynamic> _$NeoStepperItemModelToJson(
        NeoStepperItemModel instance) =>
    <String, dynamic>{
      'isSelected': instance.isSelected,
      'iconUrn': instance.iconUrn,
      'title': instance.title,
      'description': instance.description,
      'datetime': instance.datetime,
    };
