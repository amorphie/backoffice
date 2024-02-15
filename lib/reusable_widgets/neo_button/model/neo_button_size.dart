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
enum NeoButtonSize {
  @JsonValue('xSmall')
  xSmall,

  @JsonValue('small')
  small,

  @JsonValue('medium')
  medium,

  @JsonValue('large')
  large;

  static const Map<String, NeoButtonSize> _jsonValues = {
    'xSmall': NeoButtonSize.xSmall,
    'small': NeoButtonSize.small,
    'medium': NeoButtonSize.medium,
    'large': NeoButtonSize.large,
  };

  static NeoButtonSize fromJson(String json) {
    return _jsonValues[json] ?? NeoButtonSize.medium;
  }
}
