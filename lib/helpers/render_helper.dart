import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/widgets/render/render_widget.dart';

appRenderInit() {
  jsonWidgetRegistry.registerFunction(
      "copy",
      ({args, required registry}) => () async {
            if (args != null && args.length > 0) {
              await Clipboard.setData(ClipboardData(text: args.first.toString()));
              Get.snackbar("Info", "Data copied to clipboard");
            }
          });
  jsonWidgetRegistry.registerFunction(
      "url",
      ({args, required registry}) => () async {
            if (args != null && args.length > 0) {
              Future<void> _launchInBrowser(Uri url) async {
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception('Could not launch $url');
                }
              }
            }
          });
}
