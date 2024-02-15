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

import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_enable_state.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/util/neo_assets.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoButton => WidgetbookComponent(
      name: 'NeoButton',
      useCases: [
        WidgetbookUseCase(
          name: 'Primary',
          builder: (context) => NeoButton(
            transitionId: '',
            displayMode: context.knobs.list(
              label: "Display Mode",
              options: NeoButtonDisplayMode.values,
              initialOption: NeoButtonDisplayMode.primary,
            ),
            enableState: context.knobs.list(
              label: 'Enable State',
              options: NeoButtonEnableState.values,
              initialOption: NeoButtonEnableState.enabled,
            ),
            iconLeftUrn: context.knobs.stringOrNull(label: 'Icon Left Urn', initialValue: NeoAssets.plusCircle20px.urn),
            iconRightUrn: context.knobs.stringOrNull(label: 'Icon Right Urn', initialValue: NeoAssets.plusCircle20px.urn),
            labelText: context.knobs.string(label: 'Label Text', initialValue: "Button Label"),
            size: context.knobs.list(label: 'Size', options: NeoButtonSize.values, initialOption: NeoButtonSize.medium),
          ),
        ),
      ],
    );
