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
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_action_model.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:backoffice/reusable_widgets/neo_popup/neo_popup.dart';

class ShowSessionTimeoutPopupUseCase {
  Future<dynamic> call(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => NeoPopup(
        type: NeoPopupType.warning,
        titleText: "Oturum Sonlandırıldı",
        // STOPSHIP: Handle localization
        bodyText: "Uzun süredir işlem yapmadığınız için oturum sonlandırıldı. Tekrar giriş yaparak işlemlerinize devam edebilirsiniz.",
        actions: [
          NeoPopupActionModel(
            labelText: "Tamam", // STOPSHIP: Handle localization
            dismissOnAction: true,
          ),
        ],
        isLocalPopup: true,
      ),
    );
  }
}
