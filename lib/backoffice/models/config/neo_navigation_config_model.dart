import 'package:json_annotation/json_annotation.dart';

import 'search_column_model.dart';
import 'search_filter.dart';

part 'neo_navigation_config_model.g.dart';

@JsonSerializable()
class NeoNavigationConfigModel {
  List<SearchColumn> columns;
  @JsonKey(name: 'filters', includeIfNull: true, required: false)
  List<SearchFilter>? filters;
  NeoNavigationConfigModel({
    required this.columns,
    this.filters,
  });

  factory NeoNavigationConfigModel.fromJson(Map<String, dynamic> json) => _$NeoNavigationConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeoNavigationConfigModelToJson(this);
}
