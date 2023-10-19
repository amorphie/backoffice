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
      case "Page Url":
        return TransitionType.pageUrl;
      case "Html":
        return TransitionType.html;
      case "Flutter Widget":
        return TransitionType.flutterWidget;
      default:
        return TransitionType.formio;
    }
  }
}
