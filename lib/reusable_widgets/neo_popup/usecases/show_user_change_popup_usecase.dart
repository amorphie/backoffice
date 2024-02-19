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
import 'package:backoffice/reusable_widgets/neo_popup/usecases/base_show_popup_use_case.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';

class ShowUserChangePopupUseCase extends BaseShowPopupUseCase {
  @override
  Widget build(BuildContext context) {
    return NeoPopup(
      type: NeoPopupType.warning,
      titleText: "login_initial_popUp_switchUser_title",
      bodyText: "login_initial_popUp_switchUser_text",
      actions: [
        NeoPopupActionModel(
          widgetEventKey: NeoWidgetEventKeys.loginShowNewUserPage.name,
          labelText: "login_initial_popUpFirst_switchUser_button",
          dismissOnAction: true,
        ),
        NeoPopupActionModel(
          widgetEventKey: NeoWidgetEventKeys.commonClosePopup.name,
          labelText: "login_initial_popUpSecond_switchUser_button",
          displayMode: NeoButtonDisplayMode.line,
          dismissOnAction: true,
        ),
      ],
    );
  }
}
