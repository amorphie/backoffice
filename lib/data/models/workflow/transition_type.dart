enum TransitionType {
  formio,
  pageUrl,
  html,
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
