/*
 * neo_bank
 *
 * Created on 6/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_config.dart';
import 'package:backoffice/core/navigation/navigation_helper.dart';
import 'package:neo_core/core/navigation/i_neo_navigation_helper.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

abstract class _Constants {
  static const String deepLinkSchema = "neobank://";
  static const String loginNavigationPath = "login";
  static const String deepLinkCachedKey = "deepLinkNavigationPath";
}

class NeoDeepLinkListener extends StatefulWidget {
  const NeoDeepLinkListener({required this.child, required this.navigatorKey, Key? key}) : super(key: key);

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<NeoDeepLinkListener> createState() => _NeoDeepLinkListenerState();
}

class _NeoDeepLinkListenerState extends State<NeoDeepLinkListener> {
  StreamSubscription<Uri>? _deepLinkUriStream;
  late final AppLinks appLinks;
  late final INeoNavigationHelper neoNavigationHelper;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    appLinks = AppLinks();
    neoNavigationHelper = NeoNavigationHelper();
    _listenForDeepLinks();
  }

  Future<void> _listenForDeepLinks() async {
    final initialAppLink = await appLinks.getInitialAppLink();

    // Check initial link if app was in cold state (terminated)
    if (initialAppLink != null) {
      await openAppLink(initialAppLink);
    }

    // Handle link when app is in warm state (front or background)
    _deepLinkUriStream = appLinks.uriLinkStream.listen(openAppLink);
  }

  Future<void> openAppLink(Uri uri) async {
    final context = widget.navigatorKey.currentContext;
    if (!uri.toString().startsWith(_Constants.deepLinkSchema)) {
      return;
    }
    final navigationPath = uri.toString().substring(_Constants.deepLinkSchema.length);

    if (context != null && navigationPath.isNotEmpty) {
      final isLoginRequired = await GetIt.I<NeoNavigationGroupConfig>().isLoginRequired(navigationPath);
      if (isLoginRequired) {
        GetIt.I<NeoParameterManager>().writeToCache(_Constants.deepLinkCachedKey, navigationPath);
      }
      if (context.mounted) {
        await neoNavigationHelper.navigate(
          context: context,
          navigationType: NeoNavigationType.pushReplacement,
          navigationPath: isLoginRequired ? _Constants.loginNavigationPath : navigationPath,
        );
      }
    }
  }

  @override
  void dispose() {
    _deepLinkUriStream?.cancel();
    super.dispose();
  }
}
