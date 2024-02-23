/*
 * 
 * neo_bank
 * 
 * Created on 16/02/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

class NavigateWithEventBusNavigationHandlerUseCase {
  static void call(NeoNavigationType navigationType, String navigationPath) {
    switch (navigationType) {
      case NeoNavigationType.popUntil:
        NeoWidgetEventKeys.globalNavigationPopUntil.sendEvent(data: navigationPath);
        break;
      case NeoNavigationType.push:
        NeoWidgetEventKeys.globalNavigationPush.sendEvent(data: navigationPath);
        break;
      case NeoNavigationType.pushReplacement:
        NeoWidgetEventKeys.globalNavigationPushReplacement.sendEvent(data: navigationPath);
        break;
      case NeoNavigationType.pushAsRoot:
        NeoWidgetEventKeys.globalNavigationPushAsRoot.sendEvent(data: navigationPath);
        break;
      case NeoNavigationType.pop:
        NeoWidgetEventKeys.globalNavigationPop.sendEvent(data: navigationPath);
        break;
      case NeoNavigationType.popup:
      case NeoNavigationType.bottomSheet:
        // No-op
        break;
    }
  }
}
