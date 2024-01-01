import '../helpers/exporter.dart';

class AppSettings {
  static const String lang = "en-EN";
  static String get projectHost => dotenv.env["PROJECT_HOST"] ?? "";
  static String xDeviceId = "";
  static String xTokenId = "";
  static const httpConfigFilePath = "assets/json/http_client_config.json";
}
