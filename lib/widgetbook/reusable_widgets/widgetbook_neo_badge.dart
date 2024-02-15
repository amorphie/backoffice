import 'package:backoffice/reusable_widgets/neo_badge/model/neo_badge_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_badge/neo_badge.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoTagView => WidgetbookComponent(
      name: 'NeoBadge',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoBadge(
            text: context.knobs.string(label: 'Tag Text', initialValue: 'Tag Text'),
            iconUrn: context.knobs.string(label: 'Image Urn', initialValue: NeoAssets.check20px.urn),
            minWidth: context.knobs.double.input(label: 'Min Width', initialValue: 100),
            displayMode: context.knobs.list<NeoBadgeDisplayMode>(
              label: 'Type',
              labelBuilder: (value) => switch (value) {
                NeoBadgeDisplayMode.green => 'green',
                NeoBadgeDisplayMode.red => 'red',
                NeoBadgeDisplayMode.orange => 'orange',
                NeoBadgeDisplayMode.blue => 'blue',
                NeoBadgeDisplayMode.purple => 'purple',
                NeoBadgeDisplayMode.yellow => 'yellow',
                NeoBadgeDisplayMode.black => 'black',
                NeoBadgeDisplayMode.greenHighlighted => 'greenHighlighted',
                NeoBadgeDisplayMode.redHighlighted => 'redHighlighted',
                NeoBadgeDisplayMode.orangeHighlighted => 'orangeHighlighted',
                NeoBadgeDisplayMode.blueHighlighted => 'blueHighlighted',
                NeoBadgeDisplayMode.purpleHighlighted => 'purpleHighlighted',
                NeoBadgeDisplayMode.yellowHighlighted => 'yellowHighlighted',
                NeoBadgeDisplayMode.blackHighlighted => 'blackHighlighted',
              },
              options: NeoBadgeDisplayMode.values,
              initialOption: NeoBadgeDisplayMode.green,
            ),
          ),
        ),
      ],
    );
