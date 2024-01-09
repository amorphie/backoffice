import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/home/ui/widgets/account_summary/home_account_summary_widget.dart';

part 'home_account_summary_widget_builder.g.dart';

@JsonWidget(type: 'home_account_summary_widget')
abstract class _HomeAccountSummaryWidgetBuilder extends JsonWidgetBuilder {
  const _HomeAccountSummaryWidgetBuilder({
    required super.args,
  });

  @override
  HomeAccountSummaryWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
