import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_redirect_camera_settings_popup_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_redirect_gallery_settings_popup_usecase.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';

abstract class _Constant {
  static const androidSdkVersion = 32;
}

class PermissionManager {
  static Future<bool> checkGalleryPermission(BuildContext context) {
    if (Platform.isAndroid) {
      return _checkAndroidGalleryPermission(context);
    } else {
      return _checkIosGalleryPermission(context);
    }
  }

  static Future<bool> checkCameraPermission(BuildContext context) async {
    return _requestPermission(context, Permission.camera);
  }

  static Future<bool> _checkAndroidGalleryPermission(BuildContext context) async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;

    if (!context.mounted) {
      return false;
    }

    return _requestPermission(
      context,
      androidInfo.version.sdkInt <= _Constant.androidSdkVersion ? Permission.storage : Permission.photos,
    );
  }

  static Future<bool> _checkIosGalleryPermission(BuildContext context) async {
    return _requestPermission(context, Permission.photos);
  }

  static Future<bool> _requestPermission(BuildContext context, Permission permission) async {
    var status = await permission.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      status = await permission.request();
    }

    if (status.isPermanentlyDenied && context.mounted) {
      if (permission == Permission.camera) {
        await ShowRedirectCameraSettingsPopupUseCase().call(context);
      } else if (permission == Permission.photos || permission == Permission.storage) {
        await ShowRedirectGallerySettingsPopupUseCase().call(context);
      }
      await openAppSettings();
    }

    return status.isGranted;
  }
}
