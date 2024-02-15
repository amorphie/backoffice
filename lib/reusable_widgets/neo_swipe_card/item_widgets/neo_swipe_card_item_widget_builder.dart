import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/item_widgets/neo_swipe_card_item_widget.dart';

part 'neo_swipe_card_item_widget_builder.g.dart';

@JsonWidget(type: 'neo_swipe_card_item_widget')
abstract class _NeoSwipeCardItemWidgetBuilder extends JsonWidgetBuilder {
  const _NeoSwipeCardItemWidgetBuilder({required super.args});

  @override
  NeoSwipeCardItemWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
