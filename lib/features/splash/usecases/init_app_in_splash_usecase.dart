/*
 * neo_bank
 *
 * Created on 8/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/dynamic_widget_system/registerers/custom_arg_processor_registerer.dart';
import 'package:backoffice/core/dynamic_widget_system/registerers/custom_widget_registerer.dart';
import 'package:backoffice/core/environment_variables/neo_environment.dart';
import 'package:backoffice/core/environment_variables/neo_environment_type.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/neo_secure_storage/neo_secure_storage.dart';
import 'package:backoffice/features/splash/models/splash_initialization_result.dart';
import 'package:backoffice/features/splash/usecases/fetch_apps_initial_transition_usecase.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:backoffice/util/neo_http_overrides.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';
import 'package:neo_core/neo_core.dart';

class InitAppInSplashUseCase {
  /// Returns isLoggedIn boolean parameter to determine whether user is logged in or not.
  Future<SplashInitializationResult> call(GlobalKey<NavigatorState> navigatorKey) async {
    await _setInitialEnvironment();
    CustomWidgetRegisterer().init();
    CustomArgProcessorRegisterer().init();
    await _initBurganSDKs();

    /// Add your init methods in this Future.wait list whenever possible for parallel async initialization

    await configureDependencies(navigatorKey);
    await _initProxySettings();
    await _loadLocalizationData();
    await NeoCoreSecureStorage().deleteTokens();

    return _getInitSplashResult();
  }

  Future<SplashInitializationResult> _getInitSplashResult() async {
    final results = await Future.wait([
      NeoCoreSecureStorage().getCustomerId(),
      FetchAppsInitialTransitionUseCase().call(),
    ]);
    final customerId = results[0];
    final isLoggedIn = customerId != null && customerId is String && customerId.isNotEmpty;
    return SplashInitializationResult(
      isLoggedIn: isLoggedIn,
      initialTransitionData: results[1]! as SignalrTransitionData,
    );
  }

  Future<void> _setInitialEnvironment() async {
    await NeoEnvironment.init();
  }

  Future<void> _initProxySettings() async {
    if (!NeoEnvironment.current.isProd && !kIsWeb) {
      await NeoHttpOverrides.addSystemProxy();
    }
  }

  Future<void> _initBurganSDKs() async {
    await Future.wait([
      // ignore: avoid_redundant_argument_values
      NeoCore.init(enableCrashlytics: !kDebugMode, enablePosthog: !kDebugMode),
      NeoSecureStorage().init(),
    ]);
  }

  Future _loadLocalizationData() async {
    LocalizationBloc.localizationData = json.decode(await rootBundle.loadString(AppConstants.localizationFilePath));
  }
}
