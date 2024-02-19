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

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoImage => WidgetbookComponent(
      name: 'NeoImage',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => Center(
            child: NeoImage(
              imageUrn: context.knobs.string(label: "Icon Urn", initialValue: 'urn:local:images:card_debit:png'),
            ),
          ),
        ),
      ],
    );
