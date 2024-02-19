import 'package:backoffice/reusable_widgets/neo_switch/neo_switch.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoSwitch => WidgetbookComponent(
      name: 'NeoSwitch',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoSwitch(
            dataKey: "",
            initialValue: context.knobs.boolean(label: 'initialValue'),
          ),
        ),
      ],
    );
