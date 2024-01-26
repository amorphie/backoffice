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

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:backoffice/core/core_widgets/neo_app/bloc/neo_app_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_session_expiration_listener/neo_session_expiration_listener.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/dynamic_widget_system/registerers/custom_arg_processor_registerer.dart';
import 'package:backoffice/core/dynamic_widget_system/registerers/custom_widget_registerer.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/localization/language.dart';
import 'package:backoffice/core/navigation/deep_link/neo_deep_link_listener.dart';
import 'package:backoffice/core/navigation/navigation_helper.dart';
import 'package:backoffice/core/navigation/route_builder/back_navigation_page_route_builder.dart';
import 'package:backoffice/core/neo_secure_storage/neo_secure_storage.dart';
import 'package:backoffice/core/pages/neo_component_page.dart';
import 'package:backoffice/core/pages/neo_page_id.dart';
import 'package:backoffice/core/pages/neo_workflow_page.dart';
import 'package:backoffice/features/account_details/account_details_page_route.dart';
import 'package:backoffice/features/home/routing/home_page_route.dart';
import 'package:backoffice/features/photo_selection_verify_page/photo_selection_verify_page_route.dart';
import 'package:backoffice/features/splash/splash_page_route.dart';
import 'package:backoffice/features/welcome_page/welcome_page_route.dart';
import 'package:backoffice/util/neo_environment.dart';
import 'package:backoffice/util/neo_http_overrides.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/analytics/neo_logger.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';
import 'package:neo_core/core/util/neo_core_app_constants.dart';
import 'package:neo_core/core/widgets/neo_core_app/neo_core_app.dart';
import 'package:neo_core/core/widgets/neo_core_firebase_messaging/neo_core_firebase_messaging.dart';
import 'package:neo_core/neo_core.dart';

import 'backoffice/features/bo_home_page/bo_home_page.dart';
import 'backoffice/features/bo_search_page/bo_search_page.dart';

abstract class _NeoCoreConstant {
  static const androidDefaultIcon = "@mipmap/ic_launcher";
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final flavor = await Environment.getEnvironment();
  if (flavor != EnvironmentType.prod) {
    await NeoHttpOverrides.addSystemProxy();
  }
  await dotenv.load();

  await configureDependencies();
  await _initBurganSDKs();
  CustomWidgetRegisterer().init();
  CustomArgProcessorRegisterer().init();
  final isLoggedIn = await NeoCoreSecureStorage().getAuthToken() != null;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NeoAppBloc(isLoggedIn: isLoggedIn)),
        BlocProvider(create: (context) => LocalizationBloc()..add(LocalizationEventInit())),
      ],
      child: MyApp(),
    ),
  );
}

Future _initBurganSDKs() async {
  try {
    await NeoCore.init();
    await NeoSecureStorage().init();
  } catch (e) {
    log("NeoCore init Error", name: "NeoCore");
  }
  if (kDebugMode) {
    await NeoLogger().init();
  } else {
    await NeoLogger().init(enableCrashlytics: true, enablePosthog: true);
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return NeoCoreApp(
      appConstants: NeoCoreAppConstants(
        workflowHubUrl: AppConstants.workflowHubUrl,
        workflowMethodName: AppConstants.workflowMethodName,
      ),
      neoNavigationHelper: NeoNavigationHelper(),
      child: BlocBuilder<NeoAppBloc, NeoAppState>(
        builder: (context, state) {
          return NeoDeepLinkListener(
            navigatorKey: navigatorKey,
            child: NeoCoreFirebaseMessaging(
              onTokenChange: (String token) {
                // STOPSHIP: Send token to BFF
                if (kDebugMode) {
                  print("TOKEN: ");
                  print(token);
                }
              },
              androidDefaultIcon: _NeoCoreConstant.androidDefaultIcon,
              child: BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, state) {
                  return NeoSessionExpirationListener(
                    navigatorKey: navigatorKey,
                    child: MaterialApp(
                      navigatorKey: navigatorKey,
                      title: 'Burgan Template',
                      theme: AppTheme.light(context),
                      locale: state.language.locale,
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: Language.values.map((e) => e.locale),
                      initialRoute: NeoPageId.splash,
                      onGenerateRoute: _onGenerateRoutes,
                      navigatorObservers: NeoLogger().observers,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Route<dynamic>? _onGenerateRoutes(routeSettings) {
    final args = routeSettings.arguments as Map<String, String>? ?? {};
    final transitionData = args.isNotEmpty && !args[AppConstants.transitionDataKey].isNullOrBlank ? SignalrTransitionData.decode(args[AppConstants.transitionDataKey] ?? "") : null;

    switch (transitionData?.navigationPath ?? routeSettings.name) {
      // STOPSHIP: Delete this demo pages
      case NeoPageId.accountFirst:
        return MaterialPageRoute(
          builder: (context) => const NeoComponentPage(pageId: NeoPageId.accountFirst),
        );
      case NeoPageId.accountSecond:
        return MaterialPageRoute(
          builder: (context) => const NeoWorkflowPage(source: "state", pageId: "Flutter-Component-account-create-test2"),
        );
      case NeoPageId.accountThird:
        return MaterialPageRoute(
          builder: (context) => const NeoWorkflowPage(
            source: "state",
            pageId: "Flutter-component-account-create-approval",
          ),
        );
      case NeoPageId.accountDetails:
        return MaterialPageRoute(
          builder: (context) => AccountDetailsPageRoute(
            arguments: args,
          ),
        );

      case NeoPageId.splash:
        return MaterialPageRoute(builder: (context) => const SplashPageRoute());
      case NeoPageId.welcome:
        return MaterialPageRoute(builder: (context) => const WelcomePageRoute());
      case NeoPageId.home:
        return MaterialPageRoute(builder: (context) => const HomePageRoute());
      case NeoPageId.boHome:
        return MaterialPageRoute(builder: (context) => const BackofficeHomePage());
      case NeoPageId.searchWorkflowWidget:
        return MaterialPageRoute(
            builder: (context) => BackofficeSearchPage(
                  workflow: args["workflow"] ?? "",
                  config: args["config"],
                ));
      case NeoPageId.photoSelectionVerify:
        return MaterialPageRoute(
          builder: (context) => PhotoSelectionVerifyPageRoute(
            arguments: args,
          ),
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
      pageId: transitionData.pageId,
      initialData: transitionData.initialData,
    );
  }
}
