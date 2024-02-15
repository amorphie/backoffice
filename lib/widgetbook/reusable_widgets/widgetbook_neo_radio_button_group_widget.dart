/*
 * neo_bank
 *
 * Created on 5/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:backoffice/reusable_widgets/neo_radio_button_group/model/neo_radio_button_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_radio_button_group/neo_radio_button_group_widget.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoRadioButtonGroupWidget => WidgetbookComponent(
      name: 'NeoRadioButtonGroupWidget',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoRadioButtonGroupWidget(
            dataKey: "",
            items: [
              NeoRadioButtonItemModel(dataKey: "", title: "Selection 1"),
              NeoRadioButtonItemModel(dataKey: "", title: "Selection 2"),
              NeoRadioButtonItemModel(dataKey: "", title: "Selection 3"),
              NeoRadioButtonItemModel(dataKey: "", title: "Selection 4"),
              NeoRadioButtonItemModel(dataKey: "", title: "Selection 5"),
            ],
          ).paddingAll(20),
        ),
      ],
    );
