/*
 * neo_bank
 *
 * Created on 2/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_action_model.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:backoffice/reusable_widgets/neo_popup/neo_popup.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';

class ShowLogoutConfirmationPopupUseCase {
  Future<dynamic> call(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => NeoPopup(
        type: NeoPopupType.warning,
        titleText: "ON Mobil'den Çıkış Yap",
        bodyText: "ON Mobil'deki oturumun güvenli bir şekilde kapatılacak, emin misin?",
        actions: [
          NeoPopupActionModel(
            widgetEventKey: NeoWidgetEventKeys.logoutDialogConfirm.name,
            labelText: "Onayla", // STOPSHIP: Handle localization
            dismissOnAction: true,
          ),
          NeoPopupActionModel(
            labelText: "Vazgeç", // STOPSHIP: Handle localization
            displayMode: NeoButtonDisplayMode.line,
            dismissOnAction: true,
          ),
        ],
        isLocalPopup: true,
      ),
    );
  }
}
