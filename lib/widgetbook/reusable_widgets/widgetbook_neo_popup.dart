/*
 * Neobank.Client
 *
 * Created on 29/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_action_model.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:backoffice/reusable_widgets/neo_popup/neo_popup.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoPopup => WidgetbookComponent(
      name: 'NeoPopup',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoPopup(
            type: context.knobs.list<NeoPopupType>(
              label: 'Type',
              labelBuilder: (value) => switch (value) { NeoPopupType.success => 'success', NeoPopupType.info => 'info', NeoPopupType.warning => 'warning', NeoPopupType.error => 'error' },
              options: NeoPopupType.values,
              initialOption: NeoPopupType.error,
            ),
            titleText: context.knobs.string(label: 'Title Text', initialValue: 'Hatalı Şifre'),
            bodyText: context.knobs.string(
              label: 'Body Text',
              initialValue: 'Şifreyi 5 kere yanlış girdiğiniz için giriş yapılamıyor. Şifremi Unuttum butonuna basarak '
                  'yeni şifre alabilir. ON’a giriş yapabilirsiniz.',
            ),
            actions: context.knobs.boolean(label: "Show Actions", initialValue: true)
                ? [
                    NeoPopupActionModel(
                      transitionId: '',
                      labelText: "Tamam",
                      displayMode: context.knobs.list<NeoButtonDisplayMode>(
                        label: 'Top Button Type',
                        labelBuilder: (value) => switch (value) {
                          NeoButtonDisplayMode.primary => 'primary',
                          NeoButtonDisplayMode.secondary => 'secondary',
                          NeoButtonDisplayMode.line => 'line',
                          NeoButtonDisplayMode.textBold => 'textBold',
                          NeoButtonDisplayMode.textRegular => 'textRegular',
                        },
                        options: NeoButtonDisplayMode.values,
                        initialOption: NeoButtonDisplayMode.primary,
                      ),
                    ),
                    NeoPopupActionModel(
                      transitionId: '',
                      labelText: "Sifremi Unuttum",
                      displayMode: context.knobs.list<NeoButtonDisplayMode>(
                        label: 'Bottom Button Type',
                        labelBuilder: (value) => switch (value) {
                          NeoButtonDisplayMode.primary => 'primary',
                          NeoButtonDisplayMode.secondary => 'secondary',
                          NeoButtonDisplayMode.line => 'line',
                          NeoButtonDisplayMode.textBold => 'textBold',
                          NeoButtonDisplayMode.textRegular => 'textRegular',
                        },
                        options: NeoButtonDisplayMode.values,
                        initialOption: NeoButtonDisplayMode.line,
                      ),
                    ),
                  ]
                : null,
          ),
        ),
      ],
    );
