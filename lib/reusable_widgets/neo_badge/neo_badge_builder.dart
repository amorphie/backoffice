import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_badge/model/neo_badge_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_badge/neo_badge.dart';

part 'neo_badge_builder.g.dart';

@JsonWidget(type: 'neo_badge')
abstract class _NeoBadgeBuilder extends JsonWidgetBuilder {
  const _NeoBadgeBuilder({
    required super.args,
  });

  @override
  NeoBadge buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
