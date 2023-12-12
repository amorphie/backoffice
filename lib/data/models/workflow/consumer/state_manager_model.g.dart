// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_manager_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateManager _$StateManagerFromJson(Map<String, dynamic> json) => StateManager(
      name: json['name'] as String,
      title: json['title'] as String,
      transitions: (json['transitions'] as List<dynamic>?)
          ?.map((e) => TransitionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      isPublicForm: json['isPublicForm'] as bool? ?? false,
      publicForm: json['publicForm'] as String?,
    );

Map<String, dynamic> _$StateManagerToJson(StateManager instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transitions', instance.transitions);
  writeNotNull('status', instance.status);
  val['isPublicForm'] = instance.isPublicForm;
  writeNotNull('publicForm', instance.publicForm);
  return val;
}
