// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: unused_import
import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import '../render_widget.dart';
import 'neo_bo_tabview_model.dart';
import 'neo_bo_tabview_widget.dart';

part 'neo_bo_tabview.g.dart';

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
    required this.data,
    @JsonBuildArg() required this.model,
  });

  final ChildWidgetBuilder? childBuilder;
  final List data;
  final JsonNeoBoTabviewBuilderModel model;

  @override
  Widget build(BuildContext context) {
    List<NeoBoTabViewModel> list = data
        .map((e) => NeoBoTabViewModel(
            title: e["title"],
            tab: RenderWidget(
              template: e["view"],
              childBuilder: childBuilder,
            )))
        .toList();

    return Container(
        // width: MediaQuery.of(context).size.width,
        height: 600,
        child: NeoBoTabView(items: list));
  }
}
