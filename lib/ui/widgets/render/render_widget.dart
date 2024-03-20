// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../helpers/exporter.dart';

JsonWidgetRegistry jsonWidgetRegistry = JsonWidgetRegistry.instance;

class RenderWidget extends StatelessWidget {
  final dynamic template;
  const RenderWidget({
    Key? key,
    required this.template,
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
    ).build(context: context);
  }
}
