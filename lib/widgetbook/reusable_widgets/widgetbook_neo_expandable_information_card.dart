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
import 'package:backoffice/reusable_widgets/neo_expandable_information_card/neo_expandable_information_card.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/model/neo_information_card_display_mode.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoExpandableInformationCard => WidgetbookComponent(
      name: 'NeoExpandableInformationCard',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => Center(
            child: NeoExpandableInformationCard(
              displayMode: context.knobs.list(label: "Display Mode", options: NeoInformationCardDisplayMode.values),
              collapsedWidget: Text(
                context.knobs.string(
                  label: "Collapsed Text",
                  initialValue: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                ),
              ),
              collapseButtonText: context.knobs.string(label: "Collapsed Button Text", initialValue: "Collapsed Button Text"),
              expandedWidget: Text(
                context.knobs.string(
                  label: "Expanded Text",
                  initialValue:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                ),
              ),
              expandButtonText: context.knobs.string(label: "Expand Button Text", initialValue: "Expand Button Text"),
            ),
          ),
        ),
      ],
    );
