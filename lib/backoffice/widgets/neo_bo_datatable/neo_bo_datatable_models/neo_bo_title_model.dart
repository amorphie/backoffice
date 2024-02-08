class NeoBoTitleModel {
  Map<String, dynamic> _data = {};

  String print() => _data[AppSettings.lang] ?? "";

  NeoBoTitleModel();

  NeoBoTitleModel fromMap(Map<String, dynamic> json) {
    _data = json;
    return this;
  }

  Map<String, dynamic> toMap() => _data;
}

class AppSettings {
  static const String lang = "en-EN";
  // static String get projectHost => dotenv.env["PROJECT_HOST"] ?? "";
  static String xDeviceId = "";
  static String xTokenId = "";
}
