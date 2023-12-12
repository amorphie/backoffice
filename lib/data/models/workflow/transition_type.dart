import 'package:json_annotation/json_annotation.dart';

part 'transition_type.g.dart';

@JsonEnum(valueField: 'type', alwaysCreate: true)
enum TransitionType {
  @JsonValue("Formio")
  formio,
  @JsonValue("PageUrl")
  pageUrl,
  @JsonValue("Html")
  html,
  @JsonValue("FlutterWidget")
  flutterWidget;

  const TransitionType();

  factory TransitionType.fromMap(String val) {
    switch (val) {
      case "Formio":
        return TransitionType.formio;
      case "PageUrl":
        return TransitionType.pageUrl;
      case "Html":
        return TransitionType.html;
      case "FlutterWidget":
        return TransitionType.flutterWidget;
      default:
        return TransitionType.formio;
    }
  }
}
