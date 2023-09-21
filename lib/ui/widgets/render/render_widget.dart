// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/ui/widgets/render/test_render_template.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

JsonWidgetRegistry jsonWidgetRegistry = JsonWidgetRegistry.instance;

class RenderWidget extends StatelessWidget {
  final dynamic template;
  const RenderWidget({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context);
    // return testRender(context);
  }

  Widget testRender(BuildContext context) {
    return JsonWidgetData.fromDynamic(
      testRenderTemplateData,
      registry: jsonWidgetRegistry,
    )!
        .build(context: context);
  }

  Widget render(BuildContext context) {
    return JsonWidgetData.fromDynamic(
      template,
      registry: jsonWidgetRegistry,
    )!
        .build(context: context);
  }
}
