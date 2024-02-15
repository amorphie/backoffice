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
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_action_model.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:backoffice/reusable_widgets/neo_popup/neo_popup.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/base_show_popup_use_case.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/network/models/neo_error.dart';

class ShowGeneralErrorPopupUseCase extends BaseShowPopupUseCase {
  final NeoError neoError;

  ShowGeneralErrorPopupUseCase({required this.neoError});

  @override
  Widget build(BuildContext context) {
    return NeoPopup(
      type: NeoPopupType.error,
      titleText: neoError.title,
      bodyText: neoError.message,
      actions: [
        NeoPopupActionModel(
          labelText: LocalizationKey.generalOkayButton.loc(),
          widgetEventKey: NeoWidgetEventKeys.globalNavigationPop.name,
        ),
      ],
    );
  }
}
