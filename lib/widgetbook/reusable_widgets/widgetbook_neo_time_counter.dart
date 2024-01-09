/*
 * 
 * Neobank.Client
 * 
 * Created on 15/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:backoffice/reusable_widgets/neo_countdown_timer/neo_countdown_timer.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get wigetbookNeoCountdownTimer => WidgetbookComponent(
      name: 'NeoCountdownTimer',
      useCases: [
        WidgetbookUseCase(
          name: 'Primary',
          builder: (context) => NeoCountdownTimer(
            iconUrn: context.knobs.string(label: 'Icon Urn', initialValue: NeoAssets.clock.urn),
            duration: context.knobs.double.input(label: "Duration in seconds", initialValue: 10).toInt(),
          ),
        ),
      ],
    );
