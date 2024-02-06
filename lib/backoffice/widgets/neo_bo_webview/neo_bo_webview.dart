// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_webview_area_model.dart';
import 'neo_bo_webview_area_widget.dart';

part 'neo_bo_webview.g.dart';

@jsonWidget
abstract class _NeoBoWebview extends JsonWidgetBuilder {
  const _NeoBoWebview({
    required super.args,
  });

  @override
  _JsonNeoBoWebView buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _JsonNeoBoWebView extends StatelessWidget {
  const _JsonNeoBoWebView({
    @JsonBuildArg() this.childBuilder,
    required this.type,
    required this.source,
  });
  final String type;
  final String source;
  final ChildWidgetBuilder? childBuilder;
  @override
  Widget build(BuildContext context) {
    return NeoBoWebviewAreaWidget(
      source: _source(),
    );
  }

  WebViewSource _source() {
    switch (type) {
      case "url":
        return WebViewSource.url(source);
      case "html":
        return WebViewSource.html(source);
      case "formio":
        return WebViewSource.formio(source);

      default:
        return WebViewSource.url(source);
    }
  }
}
