import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/demo_features/demo_accounts_first/widgets/account_welcome_scaffold/account_welcome_scaffold.dart';

part 'account_welcome_scaffold_builder.g.dart';

// STOPSHIP: Delete this demo widget
@JsonWidget(type: 'account_welcome_scaffold')
abstract class _AccountWelcomeScaffoldBuilder extends JsonWidgetBuilder {
  const _AccountWelcomeScaffoldBuilder({required super.args});

  @override
  AccountWelcomeScaffold buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
