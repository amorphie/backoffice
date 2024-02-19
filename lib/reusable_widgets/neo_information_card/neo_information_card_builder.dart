import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/model/neo_information_card_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/neo_information_card.dart';

part 'neo_information_card_builder.g.dart';

@JsonWidget(type: 'neo_information_card')
abstract class _NeoInformationCardBuilder extends JsonWidgetBuilder {
  const _NeoInformationCardBuilder({required super.args});

  @override
  NeoInformationCard buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
