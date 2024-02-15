import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/neo_debit_card.dart';

part 'neo_debit_card_builder.g.dart';

@JsonWidget(type: 'neo_debit_card')
abstract class _NeoDebitCardBuilder extends JsonWidgetBuilder {
  const _NeoDebitCardBuilder({
    required super.args,
  });

  @override
  NeoDebitCard buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
