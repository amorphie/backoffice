import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:neo_core/neo_core.dart';

import '../widgets/backoffice_widget_registerer.dart';

import 'package:backoffice/util/neo_util.dart';
import 'package:flutter/material.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';

import '../features/bo_detail_page/bo_detail_page.dart';
import '../features/bo_home_page/bo_home_page.dart';
import '../features/bo_search_page/bo_search_page.dart';
import '../models/config/neo_navigation_config_model.dart';
import 'neo_bo_page_id.dart';

class NeoBoCore {
  static Future<void> init() async {
    await dotenv.load();

    BackofficeWidgetRegisterer().init();
  }

  static Future<HttpClientConfig> httpClientConfig() async {
    final httpClientResponse = await get(Uri.parse(AppConstants.httpConfigFilePath));
    return HttpClientConfig.fromJson(json.decode(httpClientResponse.body));
  }

  static Route<dynamic>? onBoGenerateRoutes(routeSettings) {
    final args = routeSettings.arguments as Map<String, String>? ?? {};
    final transitionData = args.isNotEmpty && !args[AppConstants.transitionDataKey].isNullOrBlank ? SignalrTransitionData.decode(args[AppConstants.transitionDataKey] ?? "") : null;

    switch (transitionData?.navigationPath ?? routeSettings.name) {
      case NeoBoPageId.boDetail:
        return MaterialPageRoute(
            builder: (context) => BoDetailPage(
                  data: args["data"].isNullOrBlank ? {} : json.decode(args["data"]!),
                ));
      case NeoBoPageId.searchWorkflowWidget:
        return MaterialPageRoute(
            builder: (context) => BackofficeSearchPage(
                  workflow: args["workflow"] ?? "",
                  config: NeoNavigationConfigModel.fromJson(
                    json.decode(args["config"] ?? "{}"),
                  ),
                ));

      case NeoBoPageId.boHome:
        return MaterialPageRoute(builder: (context) => const BackofficeHomePage());
      default:
        return null;
    }
  }
}
