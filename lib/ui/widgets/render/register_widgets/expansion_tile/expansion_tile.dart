// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'expansion_tile.g.dart';

/// Builder that can build an [ExpansionTile] widget.
@jsonWidget
abstract class _JsonExpansionTileBuilder extends JsonWidgetBuilder {
  const _JsonExpansionTileBuilder({
    required super.args,
  });

  @override
  _ExpansionTile buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _ExpansionTile extends StatelessWidget {
  const _ExpansionTile({
    @JsonBuildArg() this.childBuilder,
    required this.title,
    @JsonBuildArg() required this.model,
    this.children,
  });

  final ChildWidgetBuilder? childBuilder;
  final List<JsonWidgetData>? children;
  final JsonWidgetData title;
  final JsonExpansionTileBuilderModel model;

  @override
  Widget build(BuildContext context) {
    final children = this.children ?? const <JsonWidgetData>[];

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: title.build(context: context, childBuilder: childBuilder),
      children: children.map((e) => e.build(context: context, childBuilder: childBuilder)).toList(),
      iconColor: Colors.black,
    );
  }
}
