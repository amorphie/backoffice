import 'package:json_annotation/json_annotation.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

part 'sub_navigation_component_details.g.dart';

@JsonSerializable(createToJson: false)
class SubNavigationComponentDetails {
  @JsonKey(name: "displayName")
  final String displayName;

  @JsonKey(name: "icon", defaultValue: "")
  final String icon;

  @JsonKey(name: "page", defaultValue: "")
  final String navigateTo;

  @JsonKey(name: "navigationType", defaultValue: NeoNavigationType.push)
  final NeoNavigationType navigationType;

  @JsonKey(name: "new", defaultValue: false)
  final bool displayNewBadge;

  @JsonKey(name: "active", defaultValue: false)
  final bool active;

  factory SubNavigationComponentDetails.fromJson(Map json) =>
      _$SubNavigationComponentDetailsFromJson(json.cast<String, dynamic>());

  SubNavigationComponentDetails({
    required this.displayName,
    required this.icon,
    required this.navigateTo,
    required this.navigationType,
    required this.displayNewBadge,
    required this.active,
  });
}
