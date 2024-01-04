import 'package:backoffice/core/core.dart';
import 'package:neo_core/core/util/neo_core_app_constants.dart';
import 'package:neo_core/core/widgets/neo_core_app/neo_core_app.dart';

class App extends StatelessWidget {
  App({super.key});

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return NeoCoreApp(
      appConstants: const NeoCoreAppConstants(
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
