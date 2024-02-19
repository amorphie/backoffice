/*
 *
 *  neo_bank
 *  
 *  Created on 08/01/2024.
 *  Copyright (c) 2024 Commencis. All rights reserved.
 *  
 *  Save to the extent permitted by law, you may not use, copy, modify,
 *  distribute or create derivative works of this material or any part
 *  of it without the prior written consent of Commencis.
 *  Any reproduction of this material must contain this notice.
 */

import 'package:backoffice/reusable_widgets/neo_card_details/model/neo_card_details_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/neo_card_details.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoCardDetails => WidgetbookComponent(
      name: 'NeoCardDetails',
      useCases: [
        WidgetbookUseCase(
          name: "Default",
          builder: (context) => NeoCardDetails(
            displayMode: context.knobs.list(
              label: "Display Mode",
              options: NeoCardDetailsDisplayMode.values,
            ),
          ),
        ),
      ],
    );
