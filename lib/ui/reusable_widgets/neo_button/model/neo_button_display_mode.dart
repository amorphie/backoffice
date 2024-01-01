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
enum NeoButtonDisplayMode {
  @JsonValue('primary')
  primary,

  @JsonValue('secondary')
  secondary,

  @JsonValue('line')
  line,

  @JsonValue('textBold')
  textBold,

  @JsonValue('textRegular')
  textRegular;

  static const Map<String, NeoButtonDisplayMode> _jsonValues = {
    'primary': NeoButtonDisplayMode.primary,
    'secondary': NeoButtonDisplayMode.secondary,
    'line': NeoButtonDisplayMode.line,
    'textBold': NeoButtonDisplayMode.textBold,
    'textRegular': NeoButtonDisplayMode.textRegular,
  };

  static NeoButtonDisplayMode fromJson(String json) {
    return _jsonValues[json] ?? NeoButtonDisplayMode.primary;
  }
}
