// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'neo_detail_page.g.dart';

/// Builder that can build an [ExpansionTile] widget.
@jsonWidget
abstract class _JsonNeoDetailPageBuilder extends JsonWidgetBuilder {
  const _JsonNeoDetailPageBuilder({
    required super.args,
  });

  @override
  _NeoDetailPage buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _NeoDetailPage extends StatelessWidget {
  const _NeoDetailPage({
    @JsonBuildArg() this.childBuilder,
    required this.summary,
    required this.tabs,
    @JsonBuildArg() required this.model,
  });

  final ChildWidgetBuilder? childBuilder;
  final JsonWidgetData summary;
  final JsonWidgetData tabs;
  final JsonNeoDetailPageBuilderModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: summary.build(
            context: context,
            childBuilder: childBuilder,
            registry: JsonWidgetRegistry.instance,
          ),
        ),
        tabs.build(
          context: context,
          childBuilder: childBuilder,
        ),
      ],
    );
  }
}
