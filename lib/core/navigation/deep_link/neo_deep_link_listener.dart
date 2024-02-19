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
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/navigation/neo_navigation_helper.dart';
import 'package:backoffice/core/navigation/usecases/navigate_with_deeplink_usecase.dart';

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
  late final NeoNavigationHelper neoNavigationHelper = getIt.get<NeoNavigationHelper>();

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    appLinks = AppLinks();
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
    await NavigateWithDeeplinkUseCase().call(widget.navigatorKey, uri.toString());
  }

  @override
  void dispose() {
    _deepLinkUriStream?.cancel();
    super.dispose();
  }
}
