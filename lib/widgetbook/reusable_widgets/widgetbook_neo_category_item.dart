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

import 'package:flutter/cupertino.dart';
import 'package:backoffice/reusable_widgets/neo_badge/model/neo_badge_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_badge/neo_badge.dart';
import 'package:backoffice/reusable_widgets/neo_category_item_widget/neo_category_item_widget.dart';
import 'package:backoffice/util/constants/neo_constants.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoCategoryItemWidget => WidgetbookComponent(
      name: 'NeoCategoryItemWidget',
      useCases: [
        WidgetbookUseCase(
          name: "Default",
          builder: (context) => NeoCategoryItemWidget(
            title: "Title",
            subtitle: "Subtitle",
            iconUrn: NeoAssets.home24px.urn,
            body: "Body part",
            isNew: true,
            padding: const EdgeInsetsDirectional.all(NeoDimens.px20),
          ),
        ),
        WidgetbookUseCase(
          name: "With Image",
          builder: (context) => NeoCategoryItemWidget(
            title: "E-Devlet giriş",
            imageUrn: NeoAssets.smallCardImage.urn,
          ),
        ),
        WidgetbookUseCase(
          name: "With Chevron",
          builder: (context) => NeoCategoryItemWidget(
            subtitle: "Ödemeler",
            hasChevron: true,
            iconUrn: NeoAssets.menu24px.urn,
            padding: const EdgeInsetsDirectional.all(NeoDimens.px20),
          ),
        ),
        WidgetbookUseCase(
          name: "With Badge",
          builder: (context) => NeoCategoryItemWidget(
            iconUrn: NeoAssets.home24px.urn,
            subtitle: "Hesaplar",
            badge: const NeoBadge(
              text: "Açık",
              displayMode: NeoBadgeDisplayMode.purpleHighlighted,
            ),
            hasChevron: true,
            padding: const EdgeInsetsDirectional.all(NeoDimens.px20),
          ),
        ),
        WidgetbookUseCase(
          name: "Without Icon Shadow",
          builder: (context) => NeoCategoryItemWidget(
            iconUrn: NeoAssets.home24px.urn,
            title: "Kişisel Bilgiler",
            subtitle: "İletişim adresleri ve tercihler",
            hasChevron: true,
            hasShadow: false,
            padding: const EdgeInsetsDirectional.all(NeoDimens.px20),
          ),
        ),
      ],
    );
