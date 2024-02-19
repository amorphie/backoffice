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
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:backoffice/reusable_widgets/neo_success_page/neo_success_page.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoSuccessPage => WidgetbookComponent(
      name: 'NeoSuccessPage',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoSuccessPage(
            image: NeoImage(
              imageUrn: context.knobs.string(label: "Icon Urn", initialValue: 'urn:local:images:card_debit:png'),
            ),
            titleText: Text(context.knobs.string(label: "Title Text", initialValue: 'Title text')),
            descriptionTextList: [
              Text(context.knobs.string(label: "Description Text", initialValue: 'Description text')),
            ],
            buttonList: [
              NeoButton(labelText: context.knobs.string(label: "Button Title", initialValue: 'Button Title')),
            ],
          ).paddingAll(20),
        ),
      ],
    );
