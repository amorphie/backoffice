/*
 * 
 * neo_ui
 * 
 * Created on 20/11/2023.
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
enum NeoTextFormFieldBottomTextMessageType {
  @JsonValue('info')
  info,

  @JsonValue('error')
  error,

  @JsonValue('warning')
  warning;

  static const Map<String, NeoTextFormFieldBottomTextMessageType> _jsonValues = {
    'info': NeoTextFormFieldBottomTextMessageType.info,
    'error': NeoTextFormFieldBottomTextMessageType.error,
    'warning': NeoTextFormFieldBottomTextMessageType.warning,
  };

  static NeoTextFormFieldBottomTextMessageType fromJson(String json) {
    return _jsonValues[json] ?? NeoTextFormFieldBottomTextMessageType.info;
  }
}
