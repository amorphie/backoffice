// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

import 'web_view_model.dart';

export 'web_view_model.dart';

class WebViewWidget extends StatefulWidget {
  final WebViewSource source;
  final Function(dynamic msg)? onSubmit;
  final Function(dynamic msg)? onError;
  const WebViewWidget({
    Key? key,
    required this.source,
    this.onSubmit,
    this.onError,
  }) : super(key: key);

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
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
      initialSourceType: widget.source.isHtml ? SourceType.html : SourceType.url,
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width * 0.7,
      onWebViewCreated: (controller) {
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
