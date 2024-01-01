/*
 * Neobank.Client
 *
 * Created on 30/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';
import 'package:admin/ui/reusable_widgets/neo_button/model/neo_button_display_mode.dart';

part 'neo_popup_action_model.g.dart';

@JsonSerializable(createToJson: false)
class NeoPopupActionModel {
  @JsonKey(name: 'labelText')
  final String labelText;

  @JsonKey(name: 'transitionId')
  final String? transitionId;

  @JsonKey(name: 'widgetEventKey')
  final String? widgetEventKey;

  @JsonKey(name: 'displayMode')
  final NeoButtonDisplayMode displayMode;

  NeoPopupActionModel({
    this.transitionId,
    this.widgetEventKey,
    this.labelText = '',
    this.displayMode = NeoButtonDisplayMode.primary,
  });

  factory NeoPopupActionModel.fromJson(Map<String, dynamic> json) => _$NeoPopupActionModelFromJson(json);
}
