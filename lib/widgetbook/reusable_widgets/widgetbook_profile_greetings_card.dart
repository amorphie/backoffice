import 'package:backoffice/features/profile_and_settings/profile/widgets/profile_greetings_card/profile_greetings_card.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookProfileGreetingsCard => WidgetbookComponent(
      name: 'ProfileGreetingsCard',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => const ProfileGreetingsCard(),
        ),
      ],
    );
