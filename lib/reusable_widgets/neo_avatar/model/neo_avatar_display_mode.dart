import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NeoAvatarDisplayMode {
  @JsonValue('login')
  login,

  @JsonValue('defaultMode')
  defaultMode;

  static const _jsonValues = {
    'login': NeoAvatarDisplayMode.login,
    'defaultMode': NeoAvatarDisplayMode.defaultMode,
  };

  static NeoAvatarDisplayMode fromJson(String? json) {
    return _jsonValues[json] ?? NeoAvatarDisplayMode.defaultMode;
  }
}
