/*
 * neo_bank
 *
 * Created on 11/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NeoDropdownType {
  @JsonValue('securityQuestion')
  securityQuestion;

  static const Map<String, NeoDropdownType> _jsonValues = {
    'securityQuestion': NeoDropdownType.securityQuestion,
  };

  static NeoDropdownType fromJson(String json) {
    return _jsonValues[json] ?? NeoDropdownType.securityQuestion;
  }
}