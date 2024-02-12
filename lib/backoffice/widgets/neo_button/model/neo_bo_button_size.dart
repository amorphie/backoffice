/*
 * 
 * Neobank.Client
 * 
 * Created on 28/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NeoBoButtonSize {
  @JsonValue('small')
  small,

  @JsonValue('medium')
  medium,

  @JsonValue('large')
  large;

  static const Map<String, NeoBoButtonSize> _jsonValues = {
    'small': NeoBoButtonSize.small,
    'medium': NeoBoButtonSize.medium,
    'large': NeoBoButtonSize.large,
  };

  static NeoBoButtonSize fromJson(String json) {
    return _jsonValues[json] ?? NeoBoButtonSize.medium;
  }
}
