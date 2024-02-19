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
import 'package:backoffice/reusable_widgets/neo_accordion/neo_accordion.dart';
import 'package:backoffice/reusable_widgets/neo_category_item_widget/neo_category_item_widget.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoAccordion => WidgetbookComponent(
      name: "NeoAccordion",
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoAccordion(
            title: NeoCategoryItemWidget(
              title: "Accordion title",
              iconUrn: NeoAssets.building20px.urn,
            ),
            items: const NeoCategoryItemWidget(
              title: "Item title text",
              subtitle: "Subtitle",
            ),
            padding: const EdgeInsetsDirectional.all(20),
          ),
        ),
      ],
    );
