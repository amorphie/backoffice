/*
 * Neobank.Client
 *
 * Created on 15/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_animation/neo_animation.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoAnimation => WidgetbookComponent(
      name: 'NeoAnimation',
      useCases: [
        WidgetbookUseCase(
          name: 'Primary',
          builder: (context) => NeoAnimation(
            animationUrn: context.knobs.string(label: 'Animation Urn', initialValue: NeoAssets.welcomeBackground.urn),
            isFullscreen: context.knobs.boolean(label: 'Fullscreen', initialValue: true),
            width: context.knobs.double.input(label: 'Width'),
            height: context.knobs.double.input(label: 'Height'),
            padding: EdgeInsetsDirectional.all(context.knobs.double.input(label: 'Padding')),
            repeat: context.knobs.boolean(label: 'Repeat Animation', initialValue: true),
            reverse: context.knobs.boolean(label: 'Reverse Animation'),
          ),
        ),
      ],
    );
