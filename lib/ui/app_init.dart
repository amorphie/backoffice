import 'package:admin/helpers/hub.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/entity_controller.dart';
import 'controllers/menu_controller.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      splash: Text(
        "Bakoffice\nNew UI",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      curve: Curves.easeIn,
      splashTransition: SplashTransition.fadeTransition,
      duration: 100,
      screenRouteFunction: () async {
        await Hub.shared.start();

        AppMenuController menuController = Get.find<AppMenuController>();
        EntityController entityController = Get.find<EntityController>();
        await menuController.init();
        await entityController.init();
        return "/";
      },
    );
  }
}
