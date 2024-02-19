/*
 * neo_bank
 *
 * Created on 26/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_config.dart';
import 'package:backoffice/core/navigation/neo_navigation_helper.dart';
import 'package:backoffice/features/splash/usecases/fetch_apps_initial_transition_usecase.dart';
import 'package:backoffice/util/app_constants.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

// ignore_for_file: use_build_context_synchronously

abstract class _Constants {
  static const String deepLinkSchema = "neobank://";
}

class NavigateWithDeeplinkUseCase {
  NeoNavigationHelper get _navigationHelper => getIt.get<NeoNavigationHelper>();

  Future<void> call(GlobalKey<NavigatorState> navigatorKey, String deeplink) async {
    final context = navigatorKey.currentContext;
    if (context == null || !context.mounted || !deeplink.startsWith(_Constants.deepLinkSchema)) {
      return;
    }
    final navigationPath = deeplink.substring(_Constants.deepLinkSchema.length);
    if (navigationPath.isNotEmpty) {
      final isLoginRequired = await GetIt.I<NeoNavigationGroupConfig>().isLoginRequired(navigationPath);
      if (isLoginRequired) {
        GetIt.I<NeoParameterManager>().writeToCache(AppConstants.deepLinkCacheManagerKey, navigationPath);
      }
      if (isLoginRequired) {
        await _navigateToInitialLoginPage(context);
      } else {
        await _navigationHelper.navigate(
          navigationType: NeoNavigationType.pushReplacement,
          navigationPath: navigationPath,
        );
      }
    }
  }

  Future<void> _navigateToInitialLoginPage(BuildContext context) async {
    final initialTransitionData = await FetchAppsInitialTransitionUseCase().call();
    if (initialTransitionData != null) {
      await _navigationHelper.navigateWithTransition(transitionData: initialTransitionData);
    }
  }
}
