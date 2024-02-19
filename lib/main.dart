/*
 * neo_bank
 *
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:backoffice/backoffice/core/neo_bo_page_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:backoffice/core/core_widgets/neo_app/bloc/neo_app_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_session_expiration_listener/neo_session_expiration_listener.dart';
import 'package:backoffice/core/core_widgets/neo_widget_event_listener/neo_widget_event_listener.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/environment_variables/neo_environment_variable.dart';
import 'package:backoffice/core/handlers/wf_loading_overlay_handler.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/localization/language.dart';
import 'package:backoffice/core/navigation/deep_link/neo_deep_link_listener.dart';
import 'package:backoffice/core/navigation/neo_navigation_helper.dart';
import 'package:backoffice/core/navigation/route_builder/back_navigation_page_route_builder.dart';
import 'package:backoffice/core/navigation/usecases/navigate_with_deeplink_usecase.dart';
import 'package:backoffice/core/pages/neo_component_page.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/core/pages/neo_workflow_page.dart';
import 'package:backoffice/features/login/data/neo_auth_status.dart';
import 'package:backoffice/features/login/usecase/get_initial_auth_status_usecase.dart';
import 'package:backoffice/features/photo_selection_verify_page/photo_selection_verify_page_route.dart';
import 'package:backoffice/features/splash/usecases/init_app_in_splash_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_general_error_popup_usecase.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/analytics/neo_logger.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';
import 'package:neo_core/core/network/neo_network.dart';
import 'package:neo_core/core/widgets/neo_core_firebase_messaging/neo_core_firebase_messaging.dart';
import 'package:neo_core/core/widgets/neo_transition_listener/neo_transition_listener_widget.dart';

import 'backoffice/core/neo_bo_core.dart';

abstract class _NeoCoreConstant {
  static const androidDefaultIcon = "@mipmap/ic_launcher";
}

final _navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final splashResult = await InitAppInSplashUseCase().call(_navigatorKey);
  final authStatus = await GetInitialAuthStatusUseCase().call();
  FlutterNativeSplash.remove();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NeoAppBloc(authStatus: authStatus)..add(const NeoAppEventInit())),
        BlocProvider(create: (context) => LocalizationBloc()..add(LocalizationEventInit())),
      ],
      child: MyApp(initialTransitionData: splashResult?.initialTransitionData),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.initialTransitionData});

  final SignalrTransitionData? initialTransitionData;

  @override
  Widget build(BuildContext context) {
    return NeoTransitionListenerWidget(
      neoNetworkManager: getIt.get<NeoNetworkManager>(),
      signalRServerUrl: NeoEnvironmentVariable.workflowHubUrl.value,
      signalRMethodName: NeoEnvironmentVariable.workflowMethodName.value,
      onPageNavigation: _handleTransitionNavigation,
      onLoggedInSuccessfully: () => _navigatorKey.currentContext?.read<NeoAppBloc>().add(const NeoAppEventUpdateAuthStatus(authStatus: NeoAuthStatus.twoFactorAuth)),
      onError: _handleTransitionError,
      onLoadingStatusChanged: _onLoadingStatusChanged,
      child: NeoWidgetEventListener(
        navigatorKey: _navigatorKey,
        child: BlocBuilder<NeoAppBloc, NeoAppState>(
          buildWhen: (context, state) => false,
          builder: (context, state) {
            return NeoDeepLinkListener(
              navigatorKey: _navigatorKey,
              child: NeoCoreFirebaseMessaging(
                networkManager: getIt.get<NeoNetworkManager>(),
                androidDefaultIcon: _NeoCoreConstant.androidDefaultIcon,
                onDeeplinkNavigation: (deeplinkUri) => NavigateWithDeeplinkUseCase().call(_navigatorKey, deeplinkUri),
                child: BlocBuilder<LocalizationBloc, LocalizationState>(
                  buildWhen: (previousState, currentState) => previousState.language != currentState.language,
                  builder: (context, state) {
                    return NeoSessionExpirationListener(
                      navigatorKey: _navigatorKey,
                      child: MaterialApp(
                        debugShowCheckedModeBanner: false,
                        builder: FToastBuilder(),
                        navigatorKey: _navigatorKey,
                        title: 'Burgan Template',
                        theme: AppTheme.light(context),
                        locale: state.language.locale,
                        localizationsDelegates: const [
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales: Language.values.map((e) => e.locale),
                        onGenerateRoute: _onGenerateRoutes,
                        initialRoute: NeoBoPageId.boHome,
                        // onGenerateInitialRoutes: (_) => [_buildWorkflowPageRoute(initialTransitionData)],
                        navigatorObservers: NeoLogger().observers,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Route<dynamic>? _onGenerateRoutes(routeSettings) {
    final args = routeSettings.arguments as Map<String, String>? ?? {};
    final transitionData = args.isNotEmpty && !args[AppConstants.transitionDataKey].isNullOrBlank ? SignalrTransitionData.decode(args[AppConstants.transitionDataKey] ?? "") : null;
    Route? boRoute = NeoBoCore.onBoGenerateRoutes(routeSettings);
    if (boRoute != null) {
      return boRoute;
    }
    switch (transitionData?.navigationPath ?? routeSettings.name) {
      // TODO: Order pageIds alphabetically to prevent possible conflicts!
      case NeoPageId.debitCardDashboard:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.debitCardDashboard));
      case NeoPageId.debitCardTransactions:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.debitCardTransactions));
      case NeoPageId.home:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.home));
      case NeoPageId.otherTransactions:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.otherTransactions));
      case NeoPageId.otherTransactionsDocuments:
        return MaterialPageRoute(
          builder: (context) => const NeoComponentPage(pageId: NeoPageId.otherTransactionsDocuments),
        );
      case NeoPageId.permissions:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.permissions));
      case NeoPageId.personalInformation:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.personalInformation));
      case NeoPageId.photoSelectionVerify:
        return MaterialPageRoute(builder: (context) => PhotoSelectionVerifyPageRoute(arguments: args));
      case NeoPageId.settings:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.settings));
      case NeoPageId.settingsAboutOnMobile:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.settingsAboutOnMobile));
      case NeoPageId.settingsApplication:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.settingsApplication));
      case NeoPageId.settingsNotifications:
        return MaterialPageRoute(builder: (context) => const NeoComponentPage(pageId: NeoPageId.settingsNotifications));
      case NeoPageId.settingsUsedTechnologies:
        return MaterialPageRoute(
          builder: (context) => const NeoComponentPage(pageId: NeoPageId.settingsUsedTechnologies),
        );
      default:
        return _buildWorkflowPageRoute(transitionData);
    }
  }

  PageRoute<dynamic> _buildWorkflowPageRoute(SignalrTransitionData? transitionData) {
    if (transitionData?.isBackNavigation ?? false) {
      return BackNavigationPageRouteBuilder(page: _getWorkflowPage(transitionData));
    } else {
      return MaterialPageRoute(builder: (context) => _getWorkflowPage(transitionData));
    }
  }

  Widget _getWorkflowPage(SignalrTransitionData? transitionData) {
    if (transitionData == null) {
      // STOPSHIP: Handle page not found case
      return const SizedBox.shrink();
    }
    return NeoWorkflowPage(
      source: transitionData.viewSource,
      pageId: transitionData.navigationPath,
      initialData: transitionData.initialData,
    );
  }

  void _handleTransitionNavigation(navigationData) {
    getIt.get<NeoNavigationHelper>().navigateWithTransition(transitionData: navigationData);
  }

  void _handleTransitionError(NeoError neoError) {
    NeoWidgetEventKeys.globalSignalrNetworkError.sendEvent(data: neoError);
    if (_navigatorKey.currentContext != null) {
      ShowGeneralErrorPopupUseCase(neoError: neoError).call(_navigatorKey.currentContext!);
    }
  }

  void _onLoadingStatusChanged({required bool displayLoading}) {
    if (displayLoading) {
      final context = _navigatorKey.currentContext;
      if (context != null) {
        WfLoadingOverlayHandler.showOverlay(context);
      }
    } else {
      WfLoadingOverlayHandler.hide();
    }
  }
}
