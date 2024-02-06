// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import 'neo_bo_webview_area_model.dart';

class NeoBoWebviewAreaWidget extends StatefulWidget {
  final WebViewSource source;
  final Function(dynamic msg)? onSubmit;
  final Function(dynamic msg)? onError;
  const NeoBoWebviewAreaWidget({
    Key? key,
    required this.source,
    this.onSubmit,
    this.onError,
  }) : super(key: key);

  @override
  State<NeoBoWebviewAreaWidget> createState() => _NeoBoWebviewAreaWidgetState();
}

class _NeoBoWebviewAreaWidgetState extends State<NeoBoWebviewAreaWidget> {
  late WebViewXController webviewController;
  @override
  void dispose() {
    super.dispose();

    webviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewX(
      key: const ValueKey('formio'),
      initialContent: widget.source.source,
      initialSourceType: widget.source.isFormio ? SourceType.url : SourceType.html,
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width * 0.7,
      onWebViewCreated: (controller) {
        if (widget.source.isUrl) {
          controller.loadContent(
            widget.source.source,
          );
        }
        webviewController = controller;
        widget.source.callJsMethod = webviewController.callJsMethod;
      },
      dartCallBacks: {
        if (widget.onSubmit != null)
          DartCallback(
            name: 'submit',
            callBack: widget.onSubmit!,
          ),
        if (widget.onError != null)
          DartCallback(
            name: 'error',
            callBack: widget.onError!,
          )
      },
    );
  }
}
