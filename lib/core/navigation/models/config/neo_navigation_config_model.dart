import 'package:backoffice/core/models/entity/layout_helpers/search_column_model.dart';
import 'package:backoffice/core/navigation/models/config/search_filter.dart';
import 'package:json_annotation/json_annotation.dart';

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
