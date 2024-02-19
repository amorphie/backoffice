import 'package:backoffice/core/environment_variables/neo_environment_type.dart';
import 'package:package_info_plus/package_info_plus.dart';

class NeoEnvironment {
  NeoEnvironment._();

  static late NeoEnvironmentType current;

  static Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    current = NeoEnvironmentType.fromApplicationId(packageInfo.packageName);
  }
}
