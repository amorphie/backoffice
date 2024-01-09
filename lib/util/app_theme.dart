/*
 * neo_ui
 * 
 * Created on 17/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:backoffice/util/constants/neo_colors.dart';
import 'package:backoffice/util/constants/neo_text_styles.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(fontFamily: NeoTextStyles.fontFamily, scaffoldBackgroundColor: NeoColors.bgLight);
  }
}
