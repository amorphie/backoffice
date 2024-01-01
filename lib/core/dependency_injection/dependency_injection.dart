import 'dart:convert';

import 'package:admin/core/dependency_injection/dependency_injection.config.dart';
import 'package:admin/ui/constants/app_settings.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:neo_core/neo_core.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() {
  final registrationResult = getIt
    ..registerLazySingleton<NeoWidgetEventBus>(NeoWidgetEventBus.new)
    ..registerSingletonAsync<NeoNetworkManager>(
      () async => NeoNetworkManager(
        secureStorage: NeoCoreSecureStorage(),
        httpClientConfig: HttpClientConfig.fromJson(
          json.decode(await rootBundle.loadString(AppSettings.httpConfigFilePath)),
        ),
      ),
    )
    // ..registerSingletonAsync<NeoNavigationGroupConfig>(
    //   () async => NeoNavigationGroupConfig.fromJson(
    //     json.decode(await rootBundle.loadString(AppConstants.navigationGroupConfigFilePath)),
    //   ),
    // )
    // ..registerLazySingleton<NeoParameterManager>(NeoParameterManager.new)
    ..init();
  return registrationResult.allReady();
}
