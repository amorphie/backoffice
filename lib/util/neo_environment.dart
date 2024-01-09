import 'package:package_info_plus/package_info_plus.dart';

enum EnvironmentType { prep, prod }

abstract class _Constant {
  static const devEnvironment = "dev";
  static const prepEnvironment = "prep";
}

class Environment {
  static Future<EnvironmentType> getEnvironment() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final packageName = packageInfo.packageName;
    if (packageName.contains(_Constant.devEnvironment) || packageName.contains(_Constant.prepEnvironment)) {
      return EnvironmentType.prep;
    } else {
      return EnvironmentType.prod;
    }
  }
}
