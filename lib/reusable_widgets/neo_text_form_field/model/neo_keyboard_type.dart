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

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NeoKeyboardType {
  @JsonValue('text')
  text,

  @JsonValue('name')
  name,

  @JsonValue('number')
  number,

  @JsonValue('datetime')
  datetime,

  @JsonValue('emailAddress')
  emailAddress,

  @JsonValue('multiline')
  multiline,

  @JsonValue('none')
  none,

  @JsonValue('phone')
  phone,

  @JsonValue('streetAddress')
  streetAddress,

  @JsonValue('url')
  url;

  static const Map<String, NeoKeyboardType> _jsonValues = {
    'text': NeoKeyboardType.text,
    'name': NeoKeyboardType.name,
    'number': NeoKeyboardType.number,
    'datetime': NeoKeyboardType.datetime,
    'emailAddress': NeoKeyboardType.emailAddress,
    'multiline': NeoKeyboardType.multiline,
    'none': NeoKeyboardType.none,
    'phone': NeoKeyboardType.phone,
    'streetAddress': NeoKeyboardType.streetAddress,
    'url': NeoKeyboardType.url,
  };

  static NeoKeyboardType fromJson(String json) {
    return _jsonValues[json] ?? NeoKeyboardType.text;
  }
}

extension NeoKeyboardTypeExtension on NeoKeyboardType {
  TextInputType mapToTextInputType() {
    switch (this) {
      case NeoKeyboardType.text:
        return TextInputType.text;
      case NeoKeyboardType.name:
        return TextInputType.name;
      case NeoKeyboardType.number:
        return TextInputType.number;
      case NeoKeyboardType.datetime:
        return TextInputType.datetime;
      case NeoKeyboardType.emailAddress:
        return TextInputType.emailAddress;
      case NeoKeyboardType.multiline:
        return TextInputType.multiline;
      case NeoKeyboardType.none:
        return TextInputType.none;
      case NeoKeyboardType.phone:
        return TextInputType.phone;
      case NeoKeyboardType.streetAddress:
        return TextInputType.streetAddress;
      case NeoKeyboardType.url:
        return TextInputType.url;
    }
  }
}
