import 'dart:developer';
import 'dart:io';

import 'package:admin/ui/helpers/exporter.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static String id = "";
  Future setId() async {
    id = await getId() ?? "";
    log("id = $id", name: "DeviceInfo");
  }

  Future<String?> getId() async {
    DeviceInfoPlugin device = DeviceInfoPlugin();
    try {} catch (e) {}
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await device.webBrowserInfo;
      return webBrowserInfo.productSub;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo;
      androidInfo = await device.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await device.iosInfo;
      return iosInfo.identifierForVendor;
    } else {}
    return null;
  }
}
