/*
 * neo_bank
 *
 * Created on 25/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/util/constants/neo_colors.dart';
import 'package:backoffice/util/neo_assets.dart';

enum NeoToastType {
  success,
  warning,
  error,
}

extension NeoToastTypeExtension on NeoToastType {
  String get iconUrn => switch (this) {
        NeoToastType.success => NeoAssets.checkmarkCircle20px.urn,
        NeoToastType.warning => NeoAssets.warning20px.urn,
        NeoToastType.error => NeoAssets.error20px.urn,
      };

  Color get backgroundColor => switch (this) {
        NeoToastType.success => NeoColors.bgSuccess,
        NeoToastType.warning => NeoColors.bgWarning,
        NeoToastType.error => NeoColors.bgDanger,
      };
}
