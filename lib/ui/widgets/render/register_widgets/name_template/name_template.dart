import 'package:admin/ui/widgets/render/register_widgets/name_template/name_template_widget.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

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
