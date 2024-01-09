import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/demo_features/demo_saving_accounts_flow_two/widgets/accounts_custom_info_text.dart';

part 'accounts_custom_info_text_builder.g.dart';

@JsonWidget(type: 'accounts_custom_info_text')
abstract class _AccountsCustomInfoTextBuilder extends JsonWidgetBuilder {
  const _AccountsCustomInfoTextBuilder({
    required super.args,
  });

  @override
  AccountsCustomInfoText buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
