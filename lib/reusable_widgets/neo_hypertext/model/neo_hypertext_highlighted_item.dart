import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/model/neo_hypertext_action_type.dart';

part 'neo_hypertext_highlighted_item.g.dart';

@JsonSerializable()
class NeoHypertextHighlightedItem {
  @JsonKey(name: 'itemKey')
  final String itemKey;

  @JsonKey(name: 'text')
  final String? text;

  @JsonKey(name: 'data')
  final String? data;

  @JsonKey(name: 'actionType')
  final NeoHypertextActionType? actionType;

  NeoHypertextHighlightedItem({
    required this.itemKey,
    this.text,
    this.data,
    this.actionType,
  });

  factory NeoHypertextHighlightedItem.fromJson(Map<String, dynamic> json) => _$NeoHypertextHighlightedItemFromJson(json);

  Map<String, dynamic> toJson() => _$NeoHypertextHighlightedItemToJson(this);
}
