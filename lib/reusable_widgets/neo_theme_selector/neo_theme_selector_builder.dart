import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_theme_selector/neo_theme_selector.dart';

part 'neo_theme_selector_builder.g.dart';

@JsonWidget(type: 'neo_theme_selector')
abstract class _NeoThemeSelectorBuilder extends JsonWidgetBuilder {
  const _NeoThemeSelectorBuilder({required super.args});

  @override
  NeoThemeSelector buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
