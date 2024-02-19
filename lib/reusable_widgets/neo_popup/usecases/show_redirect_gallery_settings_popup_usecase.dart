/*
 * neo_bank
 *
 * Created on 5/1/2024.
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

class ShowRedirectGallerySettingsPopupUseCase extends BaseShowPopupUseCase {
  @override
  Widget build(BuildContext context) {
    return NeoPopup(
      type: NeoPopupType.warning,
      titleText: LocalizationKey.generalGalleryAccessPopupPictureTitle.loc(),
      bodyText: LocalizationKey.generalGalleryAccessPopupPictureText.loc(),
      actions: [
        NeoPopupActionModel(
          labelText: LocalizationKey.generalGalleryAccessPopupPictureButton.loc(), // STOPSHIP: Handle localization
          dismissOnAction: true,
        ),
      ],
    );
  }
}
