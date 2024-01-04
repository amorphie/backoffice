import 'package:backoffice/core/core.dart';
import 'package:flutter/foundation.dart';

import 'core/neo_secure_storage/neo_secure_storage.dart';
import 'ui/app.dart';
import 'package:neo_core/neo_core.dart';
import 'package:neo_core/core/analytics/neo_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final flavor = await Environment.getEnvironment();
  // if (flavor != EnvironmentType.prod) {
  //   await NeoHttpOverrides.addSystemProxy();
  // }

  // await configureDependencies();
  await _initBurganSDKs();
  // CustomWidgetRegisterer().init();
  // CustomArgProcessorRegisterer().init();
  final isLoggedIn = await NeoCoreSecureStorage().getAuthToken() != null;
  runApp(
    MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => NeoAppBloc(isLoggedIn: isLoggedIn)),
        // BlocProvider(create: (context) => LocalizationBloc()..add(LocalizationEventInit())),
      ],
      child: App(),
    ),
  );
}

Future _initBurganSDKs() async {
  await NeoCore.init();
  await NeoSecureStorage().init();
  if (kDebugMode) {
    await NeoLogger().init();
  } else {
    await NeoLogger().init(enableCrashlytics: true, enablePosthog: true);
  }
}
