import 'package:json_annotation/json_annotation.dart';

part 'transition_button_type.g.dart';

@JsonEnum(valueField: 'type', alwaysCreate: true)
enum TransitionButtonType {
  @JsonValue("Forward")
  forward,
  @JsonValue("Back")
  back,
  @JsonValue("Cancel")
  cancel,
}
