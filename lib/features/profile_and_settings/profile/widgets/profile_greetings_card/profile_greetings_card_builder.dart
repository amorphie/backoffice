import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/profile_and_settings/profile/widgets/profile_greetings_card/profile_greetings_card.dart';

part 'profile_greetings_card_builder.g.dart';

@JsonWidget(type: 'profile_greetings_card')
abstract class _ProfileGreetingsCardBuilder extends JsonWidgetBuilder {
  const _ProfileGreetingsCardBuilder({required super.args});

  @override
  ProfileGreetingsCard buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
