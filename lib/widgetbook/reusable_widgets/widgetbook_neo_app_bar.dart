/*
 *
 * Neobank.Client
 *
 * Created on 28/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 *
 */

import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_left_widget_type.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/neo_app_bar.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookAppBar => WidgetbookComponent(
      name: 'NeoAppBar',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoAppBar(
            leftWidgetType: context.knobs.list(
              label: "Left Widget Type",
              options: NeoAppBarLeftWidgetType.values,
              initialOption: NeoAppBarLeftWidgetType.backButton,
            ),
            title: context.knobs.stringOrNull(label: "Title"),
          ),
        ),
      ],
    );
