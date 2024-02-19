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

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_segmented_button/neo_segmented_button.dart';
import 'package:backoffice/util/constants/neo_dimens.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoSegmentedButton => WidgetbookComponent(
      name: 'NeoSegmentedButton',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => const NeoSegmentedButton(
            segments: ["Türkçe", "English"],
            initiallySelectedSegment: "Türkçe",
            padding: EdgeInsetsDirectional.all(NeoDimens.px20),
          ),
        ),
      ],
    );
