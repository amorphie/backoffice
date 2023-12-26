import 'package:admin/ui/constants/app_settings.dart';
import 'package:admin/ui/helpers/device_info.dart';

import 'helpers/exporter.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      splash: "assets/images/logo.png",
      curve: Curves.easeIn,
      splashTransition: SplashTransition.fadeTransition,
      duration: 100,
      screenRouteFunction: () async {
        AppSettings.xDeviceId = await DeviceInfo().getId() ?? Uuid().v4();
        AppSettings.xTokenId = Uuid().v4();
        appRenderInit();
        await dotenv.load();

        await Hub.shared.start();

        AppUiController menuController = Get.find<AppUiController>();
        EntityController entityController = Get.find<EntityController>();
        await menuController.init();
        await entityController.init();
        return "/";
      },
    );
  }
}
