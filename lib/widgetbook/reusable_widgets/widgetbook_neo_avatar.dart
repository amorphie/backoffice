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

import 'package:backoffice/reusable_widgets/neo_avatar/neo_avatar.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoAvatar => WidgetbookComponent(
      name: 'NeoAvatar',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoAvatar(
            imageUrn: context.knobs.string(label: 'Image Urn', initialValue: NeoAssets.profileWidgetPlaceholder.urn),
            showImage: context.knobs.boolean(label: "Show Image", initialValue: true),
          ),
        ),
      ],
    );
