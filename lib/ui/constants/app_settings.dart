import '../helpers/exporter.dart';

class AppSettings {
  static const String lang = "en-EN";
  static String get projectHost => dotenv.env["PROJECT_HOST"] ?? "";
}
