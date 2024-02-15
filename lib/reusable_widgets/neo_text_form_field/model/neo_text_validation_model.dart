/*
 * neo_bank
 *
 * Created on 5/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

part 'neo_text_validation_model.g.dart';

@JsonSerializable()
class NeoTextValidationModel {
  @JsonKey(name: 'regex')
  final String regex;

  @JsonKey(name: 'message')
  final String message;

  NeoTextValidationModel({
    required this.regex,
    required this.message,
  });

  factory NeoTextValidationModel.fromJson(Map<String, dynamic> json) => _$NeoTextValidationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NeoTextValidationModelToJson(this);
}
