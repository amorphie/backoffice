import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NeoHypertextActionType {
  @JsonValue('webView')
  webView,

  @JsonValue('callNumber')
  callNumber,

  @JsonValue('deeplink')
  deeplink;

  static const Map<String, NeoHypertextActionType> _jsonValues = {
    'webView': NeoHypertextActionType.webView,
    'callNumber': NeoHypertextActionType.callNumber,
    'deeplink': NeoHypertextActionType.deeplink,
  };

  static NeoHypertextActionType fromJson(String json) {
    return _jsonValues[json] ?? NeoHypertextActionType.webView;
  }
}
