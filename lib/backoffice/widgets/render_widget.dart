// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'test_render_template.dart';

JsonWidgetRegistry jsonWidgetRegistry = JsonWidgetRegistry.instance;

class RenderWidget extends StatelessWidget {
  final dynamic template;
  final ChildWidgetBuilder? childBuilder;
  const RenderWidget({
    Key? key,
    required this.template,
    this.childBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return testRender(context);
    return render(context);
  }

  Widget testRender(BuildContext context) {
    var temp = json.decode(testRenderTemplateData);

    return JsonWidgetData.fromDynamic(
      temp,
      registry: jsonWidgetRegistry,
    ).build(context: context);
  }

  Widget render(BuildContext context) {
    var temp = template is String ? json.decode(template) : template;
    return JsonWidgetData.fromDynamic(
      temp,
      registry: jsonWidgetRegistry,
    ).build(context: context, childBuilder: childBuilder);
  }
}
