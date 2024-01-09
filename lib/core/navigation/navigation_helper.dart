import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/core/pages/neo_workflow_page.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/analytics/neo_logger.dart';
import 'package:neo_core/core/navigation/i_neo_navigation_helper.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';

abstract class _Constants {
  static const String defaultPath = "/";
  static const String queryParameterDeliminator = '?';
  static const String deepLinkCachedKey = "deepLinkNavigationPath";
}

@singleton
class NeoNavigationHelper extends INeoNavigationHelper {
  @override
  Future<void> navigate({
    required BuildContext context,
    required NeoNavigationType navigationType,
    required String navigationPath,
  }) async {
    if (navigationPath.startsWith(NeoPageId.home)) {
      final neoParameterManager = GetIt.I<NeoParameterManager>();
      navigationPath = neoParameterManager.readFromCache(_Constants.deepLinkCachedKey) ?? navigationPath;
      neoParameterManager.deleteFromCache(_Constants.deepLinkCachedKey);
    }
    final splitResultList = navigationPath.split(_Constants.queryParameterDeliminator);
    final path = splitResultList.firstOrNull ?? _Constants.defaultPath;
    final queryParameters = Uri.tryParse(navigationPath)?.queryParameters ?? {};
    _handleNavigation(context: context, navigationType: navigationType, path: path, queryParameters: queryParameters);
  }

  Future<void> navigateWithTransition({
    required BuildContext context,
    required SignalrTransitionData transitionData,
  }) async {
    _handleNavigation(
      context: context,
      navigationType: transitionData.navigationType,
      path: transitionData.navigationPath,
      queryParameters: {AppConstants.transitionDataKey: transitionData.encode()},
      transitionData: transitionData,
    );
  }

  void _handleNavigation({
    required BuildContext context,
    required NeoNavigationType navigationType,
    required String path,
    required Map<String, String> queryParameters,
    SignalrTransitionData? transitionData,
  }) {
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

      case NeoNavigationType.popup:
        _showDialog(context, transitionData);
        break;

      case NeoNavigationType.bottomSheet:
        // TODO: Display bottomSheet
        break;
    }

    NeoLogger().logNavigationEvent(
      'navigate/$path',
      properties: {'navigationType': navigationType.name, 'navigationPath': path},
    );
  }

  Future<void> _showDialog(BuildContext context, SignalrTransitionData? transitionData) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NeoRadius.px16)),
        backgroundColor: NeoColors.textDefaultInverse,
        surfaceTintColor: Colors.transparent,
        content: NeoWorkflowPage(
          source: transitionData?.viewSource ?? "",
          pageId: transitionData?.pageId ?? "",
          initialData: transitionData?.initialData ?? {},
        ),
      ),
    );
  }
}
