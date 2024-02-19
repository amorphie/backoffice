import 'package:flutter_dotenv/flutter_dotenv.dart';

class NeoBoConstants {
  static final httpConfigFilePath = "$firebaseHost/v1/http_client_config.json";

  static String burganHost = dotenv.env["PROJECT_HOST"] ?? "";
  static String firebaseHost = dotenv.env["FIREBASE_URL"] ?? "";
}
