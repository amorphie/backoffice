/*
 * 
 * Neobank.Client
 * 
 * Created on 06/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:admin/ui/reusable_widgets/neo_button/model/neo_button_display_mode.dart';

part 'neo_button_data_model.g.dart';

@JsonSerializable()
class NeoButtonDataModel {
  @JsonKey(name: 'transitionId')
  final String transitionId;

  @JsonKey(name: 'labelText')
  final String labelText;

  @JsonKey(name: 'displayMode')
  final NeoButtonDisplayMode displayMode;

  NeoButtonDataModel({
    required this.transitionId,
    this.labelText = "",
    this.displayMode = NeoButtonDisplayMode.textRegular,
  });

  factory NeoButtonDataModel.fromJson(Map<String, dynamic> json) => _$NeoButtonDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeoButtonDataModelToJson(this);
}
