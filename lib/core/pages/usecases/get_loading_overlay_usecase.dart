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
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const loadingImageSize = 120.0;
}

class GetLoadingOverlayUseCase {
  Widget call() {
    return ColoredBox(
      color: NeoColors.baseBlack.withOpacity(AppConstants.defaultOverlayOpacity),
      child: Center(
        child: NeoImage(imageUrn: NeoAssets.splashLogo.urn, height: _Constants.loadingImageSize),
      ),
    );
  }
}
