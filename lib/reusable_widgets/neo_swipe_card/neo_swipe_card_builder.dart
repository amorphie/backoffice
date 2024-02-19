import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/neo_swipe_card.dart';

part 'neo_swipe_card_builder.g.dart';

@JsonWidget(type: 'neo_swipe_card')
abstract class _NeoSwipeCardBuilder extends JsonWidgetBuilder {
  const _NeoSwipeCardBuilder({required super.args});

  @override
  NeoSwipeCard buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
