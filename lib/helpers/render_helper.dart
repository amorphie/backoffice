import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx/webviewx.dart';

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
              if (!await launchUrl(
                Uri.parse(args.first.toString()),
                mode: LaunchMode.externalApplication,
              )) {
                throw Exception('Could not launch ${args.first.toString()}');
              }
            }
          });
  jsonWidgetRegistry.registerFunction(
      "tag_view",
      ({args, required registry}) => () async {
            if (args != null && args.length > 0) {
              _showDetailFormio(args.first.toString(), args.first.toString());
            }
          });
}

Future<void> _showDetailFormio(String data, String title) async {
  return showDialog<void>(
    context: Get.context!,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: AlertDialog(
          actionsPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(title),
          content: _buildWebViewX(data),
        ),
      );
    },
  );
}

Widget _buildWebViewX(String data) {
  return WebViewX(
    key: const ValueKey('urldata'),
    initialContent: "https://google.com.tr",
    initialSourceType: SourceType.url,
    height: double.maxFinite,
    width: MediaQuery.of(Get.context!).size.width * 0.7,

    // height: screenSize.height / 1.3,
    // width: min(screenSize.width * 0.8, 1024),
    onWebViewCreated: (controller) {},
  );
}
