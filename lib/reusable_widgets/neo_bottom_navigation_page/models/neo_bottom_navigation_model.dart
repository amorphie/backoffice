/*
 * neo_bank
 *
 * Created on 16/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

part 'neo_bottom_navigation_model.g.dart';

@JsonSerializable(createToJson: false)
class NeoBottomNavigationModel {
  @JsonKey(name: "pageId", defaultValue: "")
  final String pageId;

  @JsonKey(name: "iconUrn", defaultValue: "")
  final String iconUrn;

  @JsonKey(name: "labelText", defaultValue: "")
  final String labelText;

  @JsonKey(name: "backWidgetEventKey", defaultValue: "neoBottomNavigationSelectHomeTab")
  final String backWidgetEventKey;

  NeoBottomNavigationModel({
    required this.pageId,
    required this.iconUrn,
    required this.labelText,
    required this.backWidgetEventKey,
  });

  factory NeoBottomNavigationModel.fromJson(Map<String, dynamic> json) => _$NeoBottomNavigationModelFromJson(json);
}
