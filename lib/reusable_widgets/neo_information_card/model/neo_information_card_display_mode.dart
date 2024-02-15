import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/util/constants/neo_colors.dart';

@JsonEnum()
enum NeoInformationCardDisplayMode {
  @JsonValue('purple')
  purple,

  @JsonValue('orange')
  orange,

  @JsonValue('green')
  green,

  @JsonValue('red')
  red,

  @JsonValue('gray')
  gray;

  static const Map<String, NeoInformationCardDisplayMode> _jsonValues = {
    'purple': NeoInformationCardDisplayMode.purple,
    'orange': NeoInformationCardDisplayMode.orange,
    'green': NeoInformationCardDisplayMode.green,
    'red': NeoInformationCardDisplayMode.red,
    'gray': NeoInformationCardDisplayMode.gray,
  };

  static NeoInformationCardDisplayMode fromJson(String json) {
    return _jsonValues[json] ?? NeoInformationCardDisplayMode.purple;
  }

  Color get color {
    switch (this) {
      case NeoInformationCardDisplayMode.purple:
        return NeoColors.bgSupportPLight;
      case NeoInformationCardDisplayMode.orange:
        return NeoColors.bgWarningLight;
      case NeoInformationCardDisplayMode.green:
        return NeoColors.bgSuccessLight;
      case NeoInformationCardDisplayMode.red:
        return NeoColors.bgDangerLight;
      case NeoInformationCardDisplayMode.gray:
        return NeoColors.bgMedium;
    }
  }

  Color get iconColor {
    switch (this) {
      case NeoInformationCardDisplayMode.purple:
        return NeoColors.iconSupportP;
      case NeoInformationCardDisplayMode.orange:
        return NeoColors.iconWarning;
      case NeoInformationCardDisplayMode.green:
        return NeoColors.iconSuccess;
      case NeoInformationCardDisplayMode.red:
        return NeoColors.iconDanger;
      case NeoInformationCardDisplayMode.gray:
        return NeoColors.iconDefault;
    }
  }
}
