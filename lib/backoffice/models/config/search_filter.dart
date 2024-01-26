import 'package:json_annotation/json_annotation.dart';

import 'search_filter_dropdown.dart';

part 'search_filter.g.dart';

@JsonSerializable()
class SearchFilter {
  Map<String, String> title;
  @JsonKey(name: 'dropdown', includeIfNull: true, required: false)
  SearchFilterDropdown? dropdown;
  String filter;

  SearchFilter({
    required this.title,
    this.dropdown,
    required this.filter,
  });

  factory SearchFilter.fromJson(Map<String, dynamic> json) => _$SearchFilterFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFilterToJson(this);
}
