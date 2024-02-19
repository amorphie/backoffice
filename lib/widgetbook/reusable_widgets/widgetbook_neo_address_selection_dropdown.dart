/*
 * 
 * neo_bank
 * 
 * Created on 22/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_address_selection/neo_address_selection_dropdown.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoAddressSelectionDropdown => WidgetbookComponent(
      name: 'NeoAddressSelectionDropdown',
      useCases: [
        WidgetbookUseCase(
          name: 'Primary',
          builder: (context) => NeoAddressSelectionDropdown(
            dataKey: '',
            padding: EdgeInsetsDirectional.all(context.knobs.double.input(label: 'Padding')),
          ),
        ),
      ],
    );
