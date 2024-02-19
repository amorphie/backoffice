import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.config.dart';
import 'package:backoffice/core/environment_variables/neo_environment_variable.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_config.dart';
import 'package:backoffice/core/navigation/neo_navigation_helper.dart';
import 'package:backoffice/reusable_widgets/neo_animation/cache/lottie_animation_cache.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:neo_core/neo_core.dart';

import '../../backoffice/core/neo_bo_core.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(GlobalKey<NavigatorState> navigatorKey) {
  final registrationResult = getIt
    ..registerSingleton(NeoNavigationHelper(navigatorKey: navigatorKey))
    ..registerLazySingleton<NeoWidgetEventBus>(NeoWidgetEventBus.new)
    ..registerSingletonAsync<NeoNetworkManager>(
      () async => NeoNetworkManager(
        secureStorage: NeoCoreSecureStorage(),
        httpClientConfig: await NeoBoCore.httpClientConfig(),
        workflowClientId: NeoEnvironmentVariable.workflowClientId.value,
        workflowClientSecret: NeoEnvironmentVariable.workflowClientSecret.value,
      ),
    )
    ..registerSingletonAsync<NeoNavigationGroupConfig>(
      () async => NeoNavigationGroupConfig.fromJson(
        json.decode(await rootBundle.loadString(AppConstants.navigationGroupConfigFilePath)),
      ),
    )
    ..registerLazySingleton<NeoParameterManager>(NeoParameterManager.new)
    ..registerSingleton(LottieAnimationCache()..loadInitialAnimations())
    ..init();
  return registrationResult.allReady();
}
