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

import 'package:flutter/material.dart';
import 'package:backoffice/util/extensions/widget_extensions.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NeoHtmlWidget extends StatefulWidget {
  final String filePath;
  final EdgeInsetsDirectional padding;

  const NeoHtmlWidget({required this.filePath, this.padding = EdgeInsetsDirectional.zero, super.key});

  @override
  State<NeoHtmlWidget> createState() => _NeoHtmlWidgetState();
}

class _NeoHtmlWidgetState extends State<NeoHtmlWidget> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.loadFlutterAsset(widget.filePath);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _controller,
    ).padding(widget.padding);
  }
}
