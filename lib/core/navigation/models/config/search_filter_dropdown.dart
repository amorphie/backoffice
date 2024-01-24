import 'package:json_annotation/json_annotation.dart';

part 'search_filter_dropdown.g.dart';

@JsonSerializable()
class SearchFilterDropdown {
  String workflow;
  String key;
  String display;
  @JsonKey(name: 'allow-multi-select')
  bool allowMultiSelect;

  SearchFilterDropdown({
    required this.workflow,
    required this.key,
    required this.display,
    required this.allowMultiSelect,
  });

  factory SearchFilterDropdown.fromJson(Map<String, dynamic> json) => _$SearchFilterDropdownFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFilterDropdownToJson(this);
}
