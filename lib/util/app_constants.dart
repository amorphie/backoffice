import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppConstants {
  static const safeAreaPercentage = 0.85;
  static const workflowMethodName = "SendMessage";
  static const workflowClientId = "3fa85f64-5717-4562-b3fc-2c963f66afa6";
  static const workflowClientSecret = "sercan";
  static final httpConfigFilePath = "$firebaseHost/v1/http_client_config.json";
  static const navigationGroupConfigFilePath = "assets/json/navigation_group_config.json";
  static const transitionDataKey = "transitionData";
  static final workflowHubUrl = "https://pubagw6.$burganHost/ebank/flow/hub/hubs/genericHub";
  static const defaultAnimationDuration = Duration(milliseconds: 300);

  static String burganHost = dotenv.env["PROJECT_HOST"] ?? "";
  static String firebaseHost = dotenv.env["FIREBASE_URL"] ?? "";
}
