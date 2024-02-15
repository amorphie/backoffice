/*
 * neo_bank
 *
 * Created on 9/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

part 'neo_text_input_formatter_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NeoTextInputFormatterModel {
  NeoTextInputFormatterModel({this.regex});

  @JsonKey(name: 'regex')
  final String? regex;

  factory NeoTextInputFormatterModel.fromJson(Map<String, dynamic> json) => _$NeoTextInputFormatterModelFromJson(json);
  Map<String, dynamic> toJson() => _$NeoTextInputFormatterModelToJson(this);
}
