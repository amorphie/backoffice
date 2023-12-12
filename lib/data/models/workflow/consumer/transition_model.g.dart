// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransitionModel _$TransitionModelFromJson(Map<String, dynamic> json) =>
    TransitionModel(
      name: json['name'] as String,
      title: json['title'] as String,
      form: json['form'] as String,
      type: $enumDecode(_$TransitionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$TransitionModelToJson(TransitionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'form': instance.form,
      'type': _$TransitionTypeEnumMap[instance.type]!,
    };

const _$TransitionTypeEnumMap = {
  TransitionType.formio: 'Formio',
  TransitionType.pageUrl: 'PageUrl',
  TransitionType.html: 'Html',
  TransitionType.flutterWidget: 'FlutterWidget',
};
