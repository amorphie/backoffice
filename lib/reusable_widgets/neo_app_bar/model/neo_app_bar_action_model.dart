import 'package:json_annotation/json_annotation.dart';

part 'neo_app_bar_action_model.g.dart';

@JsonSerializable()
class NeoAppBarActionModel {
  @JsonKey(name: 'iconUrn')
  final String iconUrn;

  @JsonKey(name: 'transitionId')
  final String? transitionId;

  @JsonKey(name: 'widgetEventKey')
  final String? widgetEventKey;

  NeoAppBarActionModel({required this.iconUrn, this.transitionId, this.widgetEventKey});

  factory NeoAppBarActionModel.fromJson(Map<String, dynamic> json) => _$NeoAppBarActionModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeoAppBarActionModelToJson(this);
}
