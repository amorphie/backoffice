import 'package:backoffice/reusable_widgets/neo_theme_selector/neo_theme_selector.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoThemeSelector => WidgetbookComponent(
      name: 'NeoThemeSelector',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => const NeoThemeSelector(),
        ),
      ],
    );
