import 'package:backoffice/reusable_widgets/neo_checkbox/model/neo_checkbox_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox/neo_checkbox.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoCheckbox => WidgetbookComponent(
      name: 'NeoCheckbox',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoCheckbox(itemModel: NeoCheckboxItemModel(title: "Checkbox Test", dataKey: "")),
        ),
        WidgetbookUseCase(
          name: 'With Subtext',
          builder: (context) => NeoCheckbox(
            itemModel: NeoCheckboxItemModel(
              title: "Checkbox with Subtext",
              subtext: "Subtext example",
              dataKey: "",
            ),
          ),
        ),
      ],
    );
