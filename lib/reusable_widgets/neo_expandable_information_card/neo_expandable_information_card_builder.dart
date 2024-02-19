import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_expandable_information_card/neo_expandable_information_card.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/model/neo_information_card_display_mode.dart';

part 'neo_expandable_information_card_builder.g.dart';

@JsonWidget(type: 'neo_expandable_information_card')
abstract class _NeoExpandableInformationCardBuilder extends JsonWidgetBuilder {
  const _NeoExpandableInformationCardBuilder({required super.args});

  @override
  NeoExpandableInformationCard buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
