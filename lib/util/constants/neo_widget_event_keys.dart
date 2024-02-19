/*
 * neo_bank
 *
 * Created on 20/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:async';

import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event_bus.dart';

// TODO: Order enum values alphabetically to prevent possible conflicts!
enum NeoWidgetEventKeys {
  commonClosePopup,
  componentTreeBuilderRetryFetchingComponents,
  globalDisplayLogoutPopup,
  globalLogoutDialogConfirm,
  globalNavigateToWelcomePage,
  globalNavigationPop,
  globalNavigationPopUntil,
  globalNavigationPush,
  globalNavigationPushAsRoot,
  globalNavigationPushReplacement,
  globalPickImageFromCamera,
  globalPickImageFromGallery,

  /// In order to display a toast message, you HAVE TO pass [NeoToastModal] as a data when sending an event.
  /// Example usage;
  /// NeoWidgetEventKeys.globalShowToastMessage.sendEvent(
  ///   data: NeoToastModal(message: "Example toast message", type: NeoToastType.success),
  /// );
  globalShowToastMessage,
  globalSignalrNetworkError,
  loginDisableUserInterface,
  loginEnableUserInterface,
  loginShowNewUserPage,
  loginShowExistUserPage,
  loginTextFieldFocused,
  loginTextFieldUnfocused,
  loginDisabledPopupClosed,
  neoAppBarPressBackButton,
  neoAvatarChangePhotoEventKey,
  neoAvatarDeletePhotoEventKey,
  neoButtonChangeEnableStateEventKey,
  neoBottomNavigationSelectHomeTab,
  neoCountdownTimerRestartTimer,
  neoSegmentedButtonChangeLanguage,
  neoSwipeButtonStartTransaction,
  neoSwipeButtonStopLoading,
  neoTextFormFieldSetErrorMessageEventKey,
  neoTextFormFieldUpdateTextEventKey,
  termsAndConditionsPressContinueButton,
}

extension NeoWidgetEventKeysExtension on NeoWidgetEventKeys {
  void sendEvent({Object? data}) {
    getIt.get<NeoWidgetEventBus>().addEvent(
          NeoWidgetEvent(eventId: name, data: data),
        );
  }

  StreamSubscription<NeoWidgetEvent> listenEvent({required Function(NeoWidgetEvent) onEventReceived}) {
    return getIt.get<NeoWidgetEventBus>().listen(eventId: name, onEventReceived: onEventReceived);
  }
}

extension NeoWidgetEventKeysListExtension on List<(NeoWidgetEventKeys, Function(NeoWidgetEvent))> {
  StreamSubscription<NeoWidgetEvent> listenEvents() {
    return getIt.get<NeoWidgetEventBus>().listenEvents(
          eventIds: map((e) => e.$1.name).toList(),
          onEventReceived: (event) => forEach((e) {
            if (e.$1.name == event.eventId) {
              e.$2.call(event);
            }
          }),
        );
  }
}
