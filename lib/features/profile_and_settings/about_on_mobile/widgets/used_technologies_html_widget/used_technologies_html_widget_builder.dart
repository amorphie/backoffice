import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/profile_and_settings/about_on_mobile/widgets/used_technologies_html_widget/used_technologies_html_widget.dart';

part 'used_technologies_html_widget_builder.g.dart';

@JsonWidget(type: 'used_technologies_html_widget')
abstract class _UsedTechnologiesHtmlWidgetBuilder extends JsonWidgetBuilder {
  const _UsedTechnologiesHtmlWidgetBuilder({required super.args});

  @override
  UsedTechnologiesHtmlWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
