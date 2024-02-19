/*
 * neo_bank
 *
 * Created on 17/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:backoffice/core/core_widgets/neo_toast/models/neo_toast_model.dart';
import 'package:backoffice/core/core_widgets/neo_toast/neo_toast.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/localization/language.dart';
import 'package:backoffice/core/navigation/neo_navigation_helper.dart';
import 'package:backoffice/features/login/usecase/logout_user_usecase.dart';
import 'package:backoffice/features/login/usecase/navigate_to_welcome_page_usecase.dart';
import 'package:backoffice/features/photo_selection_verify_page/usecases/pick_local_image_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_logout_confirmation_popup_usecase.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

class ListenGlobalWidgetEventsUseCase {
  final GlobalKey<NavigatorState> navigatorKey;

  ListenGlobalWidgetEventsUseCase({required this.navigatorKey});

  BuildContext? get _context => navigatorKey.currentContext;

  StreamSubscription<NeoWidgetEvent> call() {
    // TODO: Order methods alphabetically to prevent possible conflicts!
    return [
      _listenChangeLanguageUseCase(),
      _listenDisplayLogoutPopupUseCase(),
      _listenLogoutDialogConfirmUseCase(),
      _listenNavigateToWelcomePageUseCase(),
      _listenNavigationPopUseCase(),
      _listenNavigationPopUntilUseCase(),
      _listenNavigationPushAsRootUseCase(),
      _listenNavigationPushReplacementUseCase(),
      _listenNavigationPushUseCase(),
      _listenPickImageFromCameraUseCase(),
      _listenPickImageFromGalleryUseCase(),
      _listenShowToastMessageUseCase(),
    ].listenEvents();
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenDisplayLogoutPopupUseCase() {
    return (NeoWidgetEventKeys.globalDisplayLogoutPopup, (_) => _context.requireContext(ShowLogoutConfirmationPopupUseCase().call));
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenLogoutDialogConfirmUseCase() {
    return (NeoWidgetEventKeys.globalLogoutDialogConfirm, (_) => _context.requireContext(LogoutUserUsecase().call));
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenNavigateToWelcomePageUseCase() {
    return (
      NeoWidgetEventKeys.globalNavigateToWelcomePage,
      (_) => _context.requireContext(NavigateToWelcomePageUsecase().call),
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenPickImageFromGalleryUseCase() {
    return (
      NeoWidgetEventKeys.globalPickImageFromGallery,
      (_) => _context.requireContext(PickLocalImageUsecase().pickFromGallery),
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenPickImageFromCameraUseCase() {
    return (
      NeoWidgetEventKeys.globalPickImageFromCamera,
      (_) => _context.requireContext(PickLocalImageUsecase().pickFromCamera),
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenNavigationPopUseCase() {
    return (
      NeoWidgetEventKeys.globalNavigationPop,
      (_) {
        if (_context != null) {
          Navigator.of(_context!).pop();
        }
      },
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenNavigationPopUntilUseCase() {
    return (
      NeoWidgetEventKeys.globalNavigationPopUntil,
      (NeoWidgetEvent neoWidgetEvent) => _handleNavigation(NeoNavigationType.popUntil, neoWidgetEvent),
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenNavigationPushUseCase() {
    return (
      NeoWidgetEventKeys.globalNavigationPush,
      (NeoWidgetEvent neoWidgetEvent) => _handleNavigation(NeoNavigationType.push, neoWidgetEvent),
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenNavigationPushAsRootUseCase() {
    return (
      NeoWidgetEventKeys.globalNavigationPushAsRoot,
      (NeoWidgetEvent neoWidgetEvent) => _handleNavigation(NeoNavigationType.pushAsRoot, neoWidgetEvent),
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenNavigationPushReplacementUseCase() {
    return (
      NeoWidgetEventKeys.globalNavigationPushReplacement,
      (NeoWidgetEvent neoWidgetEvent) => _handleNavigation(NeoNavigationType.pushReplacement, neoWidgetEvent),
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenShowToastMessageUseCase() {
    return (
      NeoWidgetEventKeys.globalShowToastMessage,
      (NeoWidgetEvent neoWidgetEvent) {
        if (neoWidgetEvent.data is NeoToastModal && _context != null) {
          FToast().init(_context!).showToast(
                child: NeoToast(neoWidgetEvent.data! as NeoToastModal),
                gravity: ToastGravity.TOP,
              );
        }
      },
    );
  }

  (NeoWidgetEventKeys, Function(NeoWidgetEvent)) _listenChangeLanguageUseCase() {
    return (
      NeoWidgetEventKeys.neoSegmentedButtonChangeLanguage,
      (NeoWidgetEvent neoWidgetEvent) {
        if (_context.isNotNull) {
          if (neoWidgetEvent.data == Language.turkish.languageName) {
            _context?.read<LocalizationBloc>().add(const LocalizationEventChangeLanguage(Language.turkish));
          } else if (neoWidgetEvent.data == Language.english.languageName) {
            _context?.read<LocalizationBloc>().add(const LocalizationEventChangeLanguage(Language.english));
          }
        } else {
          //No-op
        }
      }
    );
  }

  void _handleNavigation(NeoNavigationType navigationType, NeoWidgetEvent neoWidgetEvent) {
    getIt.get<NeoNavigationHelper>().navigate(
          navigationType: navigationType,
          navigationPath: neoWidgetEvent.data! as String,
        );
  }
}
