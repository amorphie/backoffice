/*
 * Neobank.Client
 *
 * Created on 24/01/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

part 'neo_radio_button_item_model.g.dart';

@JsonSerializable()
class NeoRadioButtonItemModel {
  @JsonKey(name: 'dataKey')
  final String dataKey;

  @JsonKey(name: 'title')
  final String title;

  NeoRadioButtonItemModel({
    required this.dataKey,
    required this.title,
  });

  factory NeoRadioButtonItemModel.fromJson(Map<String, dynamic> json) => _$NeoRadioButtonItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeoRadioButtonItemModelToJson(this);
}
