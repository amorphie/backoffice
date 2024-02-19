import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/neo_debit_card_list_view.dart';

part 'neo_debit_card_list_view_builder.g.dart';

@JsonWidget(type: 'neo_debit_card_list_view')
abstract class _NeoDebitCardListViewBuilder extends JsonWidgetBuilder {
  const _NeoDebitCardListViewBuilder({
    required super.args,
  });

  @override
  NeoDebitCardListView buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
