import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_navigation_group_widget/neo_navigation_group_widget.dart';
import 'package:backoffice/util/neo_util.dart';

part 'neo_navigation_group_widget_builder.g.dart';

@JsonWidget(type: 'neo_navigation_group_widget')
abstract class _NeoNavigationGroupWidgetBuilder extends JsonWidgetBuilder {
  const _NeoNavigationGroupWidgetBuilder({required super.args});

  @override
  NeoNavigationGroupWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
