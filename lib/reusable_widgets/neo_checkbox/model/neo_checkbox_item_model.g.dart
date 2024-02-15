// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_checkbox_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoCheckboxItemModel _$NeoCheckboxItemModelFromJson(
        Map<String, dynamic> json) =>
    NeoCheckboxItemModel(
      dataKey: json['dataKey'] as String,
      title: json['title'] as String?,
      subtext: json['subtext'] as String?,
      initialValue: json['initialValue'] as bool? ?? false,
    );

Map<String, dynamic> _$NeoCheckboxItemModelToJson(
        NeoCheckboxItemModel instance) =>
    <String, dynamic>{
      'dataKey': instance.dataKey,
      'title': instance.title,
      'subtext': instance.subtext,
      'initialValue': instance.initialValue,
    };
