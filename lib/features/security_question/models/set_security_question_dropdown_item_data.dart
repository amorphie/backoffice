/*
 * neo_bank
 *
 * Created on 27/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

part 'set_security_question_dropdown_item_data.g.dart';

@JsonSerializable(createToJson: false)
class SetSecurityQuestionDropdownItemData {
  @JsonKey(name: "id", defaultValue: "")
  final String id;

  @JsonKey(name: "descriptionEn", defaultValue: "")
  final String descriptionEn;

  @JsonKey(name: "descriptionTr", defaultValue: "")
  final String descriptionTr;

  SetSecurityQuestionDropdownItemData({required this.id, required this.descriptionEn, required this.descriptionTr});

  factory SetSecurityQuestionDropdownItemData.fromJson(Map<String, dynamic> json) =>
      _$SetSecurityQuestionDropdownItemDataFromJson(json);
}
