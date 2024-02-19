/*
 * 
 * neo_bank
 * 
 * Created on 17/1/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/navigation/neo_navigation_helper.dart';
import 'package:backoffice/features/splash/usecases/fetch_apps_initial_transition_usecase.dart';

class NavigateToWelcomePageUsecase {
  Future<void> call(BuildContext context) async {
    final transitionData = await FetchAppsInitialTransitionUseCase().call();
    if (transitionData != null) {
      unawaited(
        // ignore: use_build_context_synchronously
        getIt.get<NeoNavigationHelper>().navigateWithTransition(transitionData: transitionData),
      );
    }
  }
}
