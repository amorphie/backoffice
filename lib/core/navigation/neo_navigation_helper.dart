import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_workflow_popup_usecase.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/analytics/neo_logger.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';

abstract class _Constants {
  static const String defaultPath = "/";
  static const String queryParameterDeliminator = '?';
}

class NeoNavigationHelper {
  final GlobalKey<NavigatorState> navigatorKey;

  NeoNavigationHelper({required this.navigatorKey});

  Future<void> navigate({
    required NeoNavigationType navigationType,
    required String navigationPath,
  }) async {
    if (navigationPath.startsWith(NeoPageId.home)) {
      final neoParameterManager = GetIt.I<NeoParameterManager>();
      navigationPath = neoParameterManager.readFromCache(AppConstants.deepLinkCacheManagerKey) ?? navigationPath;
      neoParameterManager.deleteFromCache(AppConstants.deepLinkCacheManagerKey);
    }
    final splitResultList = navigationPath.split(_Constants.queryParameterDeliminator);
    final path = splitResultList.firstOrNull ?? _Constants.defaultPath;
    final queryParameters = Uri.tryParse(navigationPath)?.queryParameters ?? {};
    _handleNavigation(navigationType: navigationType, path: path, queryParameters: queryParameters);
  }

  Future<void> navigateWithTransition({
    required SignalrTransitionData transitionData,
  }) async {
    _handleNavigation(
      navigationType: transitionData.navigationType,
      path: transitionData.navigationPath,
      queryParameters: {AppConstants.transitionDataKey: transitionData.encode()},
      transitionData: transitionData,
    );
  }

  void _handleNavigation({
    required NeoNavigationType navigationType,
    required String path,
    required Map<String, String> queryParameters,
    SignalrTransitionData? transitionData,
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    switch (navigationType) {
      case NeoNavigationType.popUntil:
        Navigator.popUntil(context, (route) => route.settings.name == path);
        break;

      case NeoNavigationType.push:
        unawaited(Navigator.pushNamed(context, path, arguments: queryParameters));
        break;

      case NeoNavigationType.pushReplacement:
        unawaited(Navigator.pushReplacementNamed(context, path, arguments: queryParameters));
        break;

      case NeoNavigationType.pushAsRoot:
        Navigator.popUntil(context, (route) => route.isFirst);
        unawaited(Navigator.pushReplacementNamed(context, path, arguments: queryParameters));
        break;

      case NeoNavigationType.pop:
        Navigator.pop(context, queryParameters);
        break;

      case NeoNavigationType.popup:
        _showDialog(context, transitionData);
        break;

      case NeoNavigationType.bottomSheet:
        // TODO: Display bottomSheet
        break;
    }

    NeoLogger().logEvent(
      'navigate/$path',
      properties: {'navigationType': navigationType.name, 'navigationPath': path},
    );
  }

  Future<void> _showDialog(BuildContext context, SignalrTransitionData? transitionData) {
    return ShowWorkflowPopupUseCase(transitionData: transitionData).call(context);
  }
}
