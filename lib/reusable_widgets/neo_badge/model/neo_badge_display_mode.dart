import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NeoBadgeDisplayMode {

  @JsonValue('green')
  green,

  @JsonValue('red')
  red,

  @JsonValue('orange')
  orange,

  @JsonValue('blue')
  blue,

  @JsonValue('purple')
  purple,

  @JsonValue('yellow')
  yellow,

  @JsonValue('black')
  black,

  @JsonValue('greenHighlighted')
  greenHighlighted,

  @JsonValue('redHighlighted')
  redHighlighted,

  @JsonValue('orangeHighlighted')
  orangeHighlighted,

  @JsonValue('blueHighlighted')
  blueHighlighted,

  @JsonValue('purpleHighlighted')
  purpleHighlighted,

  @JsonValue('yellowHighlighted')
  yellowHighlighted,

  @JsonValue('blackHighlighted')
  blackHighlighted;

  static const _jsonValues = {
    'green': NeoBadgeDisplayMode.green,
    'red': NeoBadgeDisplayMode.red,
    'orange': NeoBadgeDisplayMode.orange,
    'blue': NeoBadgeDisplayMode.blue,
    'purple': NeoBadgeDisplayMode.purple,
    'yellow': NeoBadgeDisplayMode.yellow,
    'black': NeoBadgeDisplayMode.black,
    'greenHighlighted': NeoBadgeDisplayMode.greenHighlighted,
    'redHighlighted': NeoBadgeDisplayMode.redHighlighted,
    'orangeHighlighted': NeoBadgeDisplayMode.orangeHighlighted,
    'blueHighlighted': NeoBadgeDisplayMode.blueHighlighted,
    'purpleHighlighted': NeoBadgeDisplayMode.purpleHighlighted,
    'yellowHighlighted': NeoBadgeDisplayMode.yellowHighlighted,
    'blackHighlighted': NeoBadgeDisplayMode.blackHighlighted,
  };

  static NeoBadgeDisplayMode fromJson(String? json) {
    return _jsonValues[json] ?? NeoBadgeDisplayMode.green;
  }
}
