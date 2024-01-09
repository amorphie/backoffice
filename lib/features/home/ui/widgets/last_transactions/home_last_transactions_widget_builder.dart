import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/home/ui/widgets/last_transactions/home_last_transactions_widget.dart';

part 'home_last_transactions_widget_builder.g.dart';

@JsonWidget(type: 'home_last_transactions_widget')
abstract class _HomeLastTransactionsWidgetBuilder extends JsonWidgetBuilder {
  const _HomeLastTransactionsWidgetBuilder({
    required super.args,
  });

  @override
  HomeLastTransactionsWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
