import 'package:backoffice/reusable_widgets/neo_checkbox/model/neo_checkbox_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox_group/neo_checkbox_group_widget.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoCheckboxGroup => WidgetbookComponent(
      name: "Neo Checkbox Group",
      useCases: [
        WidgetbookUseCase(
          name: "default",
          builder: (context) => NeoCheckboxGroupWidget(
            items: [
              NeoCheckboxItemModel(
                dataKey: "",
                title: "Mobil Bildirim",
                subtext: "Mobil Bildirim Subtext",
                initialValue: true,
              ),
              NeoCheckboxItemModel(dataKey: "", title: "E-posta"),
              NeoCheckboxItemModel(dataKey: "", title: "SMS"),
            ],
          ),
        ),
      ],
    );
