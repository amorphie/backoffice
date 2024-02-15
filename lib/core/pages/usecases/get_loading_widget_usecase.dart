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
import 'package:backoffice/util/constants/neo_colors.dart';

abstract class _Constants {
  static const initialPageId = "amorphie-mobile-login";
}

class GetLoadingWidgetUsecase {
  Widget call(String pageId) {
    if (pageId == _Constants.initialPageId) {
      return ColoredBox(color: NeoColors.splashBackground, child: _defaultLoadingWidget);
    } else {
      return _defaultLoadingWidget;
    }
  }

  Widget get _defaultLoadingWidget => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Center(child: CircularProgressIndicator(color: NeoColors.bgPrimaryGreenDark))],
      );
}
