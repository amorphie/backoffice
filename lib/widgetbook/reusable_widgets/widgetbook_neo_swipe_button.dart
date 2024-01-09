/*
 * Neobank.Client
 *
 * Created on 24/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/cupertino.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_button/neo_swipe_button.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoSwipeButton => WidgetbookComponent(
      name: 'NeoSwipeButton',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoSwipeButton(
            transitionId: '',
            labelText: context.knobs.stringOrNull(label: 'labelText', initialValue: 'Giriş Yap'),
            loadingLabelText: context.knobs.stringOrNull(label: 'loadingLabelText', initialValue: 'Giriş Yapılıyor'),
            padding: EdgeInsetsDirectional.all(context.knobs.double.input(label: 'padding')),
          ),
        ),
      ],
    );
