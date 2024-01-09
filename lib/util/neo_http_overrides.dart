import 'dart:io';

import 'package:system_proxy/system_proxy.dart';

class NeoHttpOverrides extends HttpOverrides {
  final String customProxy;

  NeoHttpOverrides(this.customProxy);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        //add your certificate verification logic here
        return true;
      };
  }

  static Future<void> addSystemProxy() async {
    final Map<String, String>? proxy = await SystemProxy.getProxySettings();
    if (proxy == null) {
      return;
    }
    HttpOverrides.global = NeoHttpOverrides("${proxy['host']}:${proxy['port']}");
  }
}
