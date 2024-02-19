/*
 * neo_bank
 *
 * Created on 19/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

class NeoNavigationButton extends StatelessWidget {
  final Widget child;
  final NeoNavigationType navigationType;
  final String navigationPath;

  const NeoNavigationButton({
    required this.child,
    required this.navigationType,
    required this.navigationPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleNavigation,
      child: child,
    );
  }

  void _handleNavigation() {
    switch (navigationType) {
      case NeoNavigationType.popUntil:
        NeoWidgetEventKeys.globalNavigationPopUntil.sendEvent(data: navigationPath);
      case NeoNavigationType.push:
        NeoWidgetEventKeys.globalNavigationPush.sendEvent(data: navigationPath);
      case NeoNavigationType.pushReplacement:
        NeoWidgetEventKeys.globalNavigationPushReplacement.sendEvent(data: navigationPath);
      case NeoNavigationType.pushAsRoot:
        NeoWidgetEventKeys.globalNavigationPushAsRoot.sendEvent(data: navigationPath);
      case NeoNavigationType.pop:
        NeoWidgetEventKeys.globalNavigationPop.sendEvent(data: navigationPath);

      case NeoNavigationType.popup:
      case NeoNavigationType.bottomSheet:
        // No-op
        break;
    }
  }
}
