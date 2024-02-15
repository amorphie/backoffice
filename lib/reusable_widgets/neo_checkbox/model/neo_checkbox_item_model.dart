import 'package:json_annotation/json_annotation.dart';

part 'neo_checkbox_item_model.g.dart';

@JsonSerializable()
class NeoCheckboxItemModel {
  @JsonKey(name: 'dataKey')
  final String dataKey;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'subtext')
  final String? subtext;

  @JsonKey(name: 'initialValue')
  final bool initialValue;

  NeoCheckboxItemModel({
    required this.dataKey,
    this.title,
    this.subtext,
    this.initialValue = false,
  });

  factory NeoCheckboxItemModel.fromJson(Map<String, dynamic> json) => _$NeoCheckboxItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeoCheckboxItemModelToJson(this);
}
