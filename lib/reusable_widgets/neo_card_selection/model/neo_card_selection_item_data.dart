/*
 * 
 * neo_bank
 * 
 * Created on 29/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';

part 'neo_card_selection_item_data.g.dart';

@JsonSerializable(createToJson: false)
// ignore: must_be_immutable
class NeoCardSelectionItemData extends BaseDropdownItemData {
  NeoCardSelectionItemData({
    required super.formData,
    this.cardImageUrn,
    this.cardName,
    super.isInitiallySelected = false,
  });

  @JsonKey(name: "cardImageUrn")
  final String? cardImageUrn;

  @JsonKey(name: "cardName")
  final String? cardName;

  factory NeoCardSelectionItemData.fromJson(Map<String, dynamic> json) => _$NeoCardSelectionItemDataFromJson(json);

  @override
  List<Object?> get props => [
        formData,
        cardImageUrn,
        cardName,
      ];
}
