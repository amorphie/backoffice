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

import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_type.dart';

part 'neo_dropdown_data_model.g.dart';

@JsonSerializable(createToJson: false)
class NeoDropdownDataModel {
  @JsonKey(name: 'dataKey')
  final String dataKey;

  @JsonKey(name: 'items')
  final List<NeoDropdownListTileData> items;

  @JsonKey(name: 'dropdownType')
  final NeoDropdownType dropdownType;

  NeoDropdownDataModel({
    required this.dataKey,
    required this.items,
    required this.dropdownType,
  });

  factory NeoDropdownDataModel.fromJson(Map<String, dynamic> json) => _$NeoDropdownDataModelFromJson(json);
}
