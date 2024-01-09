import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.config.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_config.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:neo_core/neo_core.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  var httpClientResponse = await get(Uri.parse(AppConstants.httpConfigFilePath));
  final registrationResult = getIt
    ..registerLazySingleton<NeoWidgetEventBus>(NeoWidgetEventBus.new)
    ..registerSingletonAsync<NeoNetworkManager>(
      () async => NeoNetworkManager(
        secureStorage: NeoCoreSecureStorage(),
        httpClientConfig: HttpClientConfig.fromJson(
          json.decode(httpClientResponse.body),
        ),
      ),
    )
    ..registerSingletonAsync<NeoNavigationGroupConfig>(
      () async => NeoNavigationGroupConfig.fromJson(
        json.decode(await rootBundle.loadString(AppConstants.navigationGroupConfigFilePath)),
      ),
    )
    ..registerLazySingleton<NeoParameterManager>(NeoParameterManager.new)
    ..init();
  return registrationResult.allReady();
}
