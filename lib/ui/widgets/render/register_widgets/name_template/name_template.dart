import '../../../../../helpers/exporter.dart';

part 'name_template.g.dart';

@jsonWidget
abstract class _NameTemplate extends JsonWidgetBuilder {
  const _NameTemplate({
    required super.args,
  });

  @override
  NameTemplateWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return NameTemplateWidget(
      name: args["name"],
      description: args["description"],
    );
  }
}
