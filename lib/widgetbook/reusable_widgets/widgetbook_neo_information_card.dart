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
import 'package:backoffice/reusable_widgets/neo_information_card/model/neo_information_card_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/neo_information_card.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoInformationCard => WidgetbookComponent(
      name: 'NeoInformationCard',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => Center(
            child: NeoInformationCard(
              iconUrn: context.knobs.string(label: "Icon Urn", initialValue: "urn:local:icons:warning_24px:svg"),
              title: context.knobs.string(label: "Title", initialValue: "Information Card"),
              displayMode: context.knobs.list(label: "Display Mode", options: NeoInformationCardDisplayMode.values),
              content: Text(
                context.knobs.string(
                  label: "Content",
                  initialValue: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                ),
              ),
            ),
          ),
        ),
      ],
    );
