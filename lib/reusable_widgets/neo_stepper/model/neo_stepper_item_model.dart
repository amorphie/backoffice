import 'package:json_annotation/json_annotation.dart';

part 'neo_stepper_item_model.g.dart';

@JsonSerializable()
class NeoStepperItemModel {
  @JsonKey(name: 'isSelected')
  final bool isSelected;
  @JsonKey(name: 'iconUrn')
  final String iconUrn;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  // STOPSHIP: Refactor Required - The 'datetime' field needs to be explicitly typed as DateTime. Additionally, implement a utility function for consistent formatting, e.g., '27 Jun 2023'.
  @JsonKey(name: 'datetime')
  final String? datetime;

  NeoStepperItemModel({
    required this.isSelected,
    required this.iconUrn,
    this.title,
    this.description,
    this.datetime,
  });

  factory NeoStepperItemModel.fromJson(Map<String, dynamic> json) => _$NeoStepperItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeoStepperItemModelToJson(this);
}

extension NeoStepperItemModelListExtension on List<NeoStepperItemModel> {
  int findSelectedIndex() {
    return indexWhere((element) => element.isSelected);
  }
}
