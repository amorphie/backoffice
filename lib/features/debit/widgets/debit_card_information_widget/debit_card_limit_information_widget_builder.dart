import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/debit/widgets/debit_card_information_widget/debit_card_limits_information_widget.dart';

part 'debit_card_limit_information_widget_builder.g.dart';

@JsonWidget(type: 'debit_card_limit_information_widget')
abstract class _DebitCardLimitInformationWidgetBuilder extends JsonWidgetBuilder {
  const _DebitCardLimitInformationWidgetBuilder({
    required super.args,
  });

  @override
  DebitCardLimitInformationWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
