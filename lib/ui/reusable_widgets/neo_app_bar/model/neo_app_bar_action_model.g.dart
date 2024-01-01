// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_app_bar_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoAppBarActionModel _$NeoAppBarActionModelFromJson(
        Map<String, dynamic> json) =>
    NeoAppBarActionModel(
      iconUrn: json['iconUrn'] as String,
      transitionId: json['transitionId'] as String?,
      widgetEventKey: json['widgetEventKey'] as String?,
    );

Map<String, dynamic> _$NeoAppBarActionModelToJson(
        NeoAppBarActionModel instance) =>
    <String, dynamic>{
      'iconUrn': instance.iconUrn,
      'transitionId': instance.transitionId,
      'widgetEventKey': instance.widgetEventKey,
    };
