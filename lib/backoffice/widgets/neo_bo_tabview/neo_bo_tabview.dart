// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'neo_bo_tabview_widget.dart';

part 'neo_bo_tabview.g.dart';

/// Builder that can build an [NeoBoTabview] widget.
@jsonWidget
abstract class _JsonNeoBoTabviewBuilder extends JsonWidgetBuilder {
  const _JsonNeoBoTabviewBuilder({
    required super.args,
  });

  @override
  _NeoBoTabview buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _NeoBoTabview extends StatelessWidget {
  const _NeoBoTabview({
    @JsonBuildArg() this.childBuilder,
    required this.title,
    @JsonBuildArg() required this.model,
    this.children,
  });

  final ChildWidgetBuilder? childBuilder;
  final List<JsonWidgetData>? children;
  final JsonWidgetData title;
  final JsonNeoBoTabviewBuilderModel model;

  @override
  Widget build(BuildContext context) {
    final children = this.children ?? const <JsonWidgetData>[];

    return NeoBoTabView(items: []);
  }
}
