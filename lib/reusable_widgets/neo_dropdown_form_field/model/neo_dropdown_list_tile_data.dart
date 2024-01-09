/*
 * neo_bank
 *
 * Created on 25/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/core/base/dropdown/base_dropdown_item_data.dart';

part 'neo_dropdown_list_tile_data.g.dart';

@JsonSerializable(createToJson: false)
class NeoDropdownListTileData extends BaseDropdownItemData {
  NeoDropdownListTileData({
    required super.formData,
    required super.displayData,
    this.leadingIconUrn,
    this.onPressed,
    super.isInitiallySelected = false,
  });

  @JsonKey(name: "leadingIconUrn")
  final String? leadingIconUrn;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final VoidCallback? onPressed;

  factory NeoDropdownListTileData.fromJson(Map<String, dynamic> json) => _$NeoDropdownListTileDataFromJson(json);
}
