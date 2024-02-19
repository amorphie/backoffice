/*
 * neo_bank
 *
 * Created on 17/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const double iconBackgroundSize = 80;
}

class GetErrorWidgetUseCase {
  Widget call(String pageId) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NeoIcon(
            iconUrn: NeoAssets.popupIconError.urn,
            width: _Constants.iconBackgroundSize,
            height: _Constants.iconBackgroundSize,
          ).paddingOnly(bottom: NeoDimens.px12),
          NeoText(
            "Hata",
            textAlign: TextAlign.center,
            style: NeoTextStyles.bodySixteenSemibold,
          ).paddingOnly(bottom: NeoDimens.px8),
          NeoText(
            "Sayfa yüklenirken teknik bir hata meydana geldi!",
            textAlign: TextAlign.center,
            style: NeoTextStyles.bodyFourteenMedium,
          ).paddingOnly(bottom: NeoDimens.px24),
          NeoButton(
            onTap: () => NeoWidgetEventKeys.componentTreeBuilderRetryFetchingComponents.sendEvent(data: pageId),
            labelText: "Yeniden Dene",
          ),
        ],
      ).paddingAll(NeoDimens.px24),
    );
  }
}
