/*
 * neo_bank
 *
 * Created on 5/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/pages/usecases/get_loading_overlay_usecase.dart';

class WfLoadingOverlayHandler {
  WfLoadingOverlayHandler._();

  static OverlayEntry? _overlayEntry;

  static void showOverlay(BuildContext context) {
    _overlayEntry ??= OverlayEntry(
      builder: (BuildContext context) => GetLoadingOverlayUseCase().call(),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
  }
}
