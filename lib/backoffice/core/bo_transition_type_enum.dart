// ignore_for_file: constant_identifier_names

enum BoTransitionType {
  Formio,
  Html,
  FlutterWidget;

  BoTransitionType fromString(String value) {
    switch (value) {
      case 'Formio':
        return BoTransitionType.Formio;
      case 'Html':
        return BoTransitionType.Html;
      case 'FlutterWidget':
        return BoTransitionType.FlutterWidget;
      default:
        return BoTransitionType.Formio;
    }
  }

  String toValue() {
    switch (this) {
      case BoTransitionType.Formio:
        return 'Formio';
      case BoTransitionType.Html:
        return 'Html';
      case BoTransitionType.FlutterWidget:
        return 'FlutterWidget';
    }
  }
}
