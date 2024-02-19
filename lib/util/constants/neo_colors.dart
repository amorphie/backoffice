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
import 'package:backoffice/util/neo_util.dart';

abstract class NeoColors {
  // Global Tokens
  // Base Colors
  static const baseWhite = Color(0xFFFFFFFF);
  static const baseBlack = Color(0xFF000000);

  // Primary Colors
  static const primaryGreenLight = Color(0xFFE5FFE5);
  static const primaryGreenDefault = Color(0xFF00FF00);
  static const primaryGreenDark = Color(0xFF00CC00);
  static const primaryBlackLight = Color(0xFFF5F5F5);
  static const primaryBlackDefault = Color(0xFF2D2A26);
  static const primaryBlackDark = Color(0xFF292623);

  // Neutral Colors
  static const neutral = MaterialColor(0xFFDEDEDE, {
    0: Color(0xFFFDFDFD),
    25: Color(0xFFF9F9F9),
    50: Color(0xFFF6F6F6),
    100: Color(0xFFF2F2F2),
    200: Color(0xFFEFEFEF),
    300: Color(0xFFEBEBEB),
    400: Color(0xFFE4E4E4),
    500: Color(0xFFDEDEDE),
    600: Color(0xFFD6D6D6),
    700: Color(0xFFA7A7A7),
    800: Color(0xFF818181),
    900: Color(0xFF636363),
  });

  // Supportive Colors
  static const supPurple = MaterialColor(0xFFA264F3, {
    0: Color(0xFFFCFAFF),
    25: Color(0xFFFBF8FF),
    50: Color(0xFFF6F0FE),
    100: Color(0xFFE2CFFB),
    200: Color(0xFFD4B8F9),
    300: Color(0xFFC197F7),
    400: Color(0xFFB583F5),
    500: Color(0xFFA264F3),
    600: Color(0xFF935BDD),
    700: Color(0xFF7347AD),
  });

  static const supYellow = MaterialColor(0xFFFFDB5A, {
    0: Color(0xFFFFFEF9),
    25: Color(0xFFFFFBEB),
    50: Color(0xFFFFF9E2),
    100: Color(0xFFFFF6D4),
    200: Color(0xFFFFF1BF),
    300: Color(0xFFFFEAA0),
    400: Color(0xFFFFE175),
    500: Color(0xFFFFDB5A),
    600: Color(0xFFFFD231),
    700: Color(0xFFE8BF2D),
  });

  // System Colors
  static const sysBlue = MaterialColor(0xFF2660DA, {
    0: Color(0xFFF8FAFE),
    25: Color(0xFFF5F8FB),
    50: Color(0xFFBCCEF4),
    100: Color(0xFFBCCEF4),
    200: Color(0xFF9BB6EE),
    300: Color(0xFF6E94E6),
    400: Color(0xFF5180E1),
    500: Color(0xFF2660DA),
    600: Color(0xFF2357C6),
    700: Color(0xFF1B449B),
  });

  static const sysGreen = MaterialColor(0xFF12B76A, {
    0: Color(0xFFF8FDFA),
    25: Color(0xFFF4FCF8),
    50: Color(0xFFE7F8F0),
    100: Color(0xFFB6E9D1),
    200: Color(0xFF92DEBA),
    300: Color(0xFF60CF9B),
    400: Color(0xFF41C588),
    500: Color(0xFF12B76A),
    600: Color(0xFF10A760),
    700: Color(0xFF0D824B),
  });

  static const sysRed = MaterialColor(0xFFF04438, {
    0: Color(0xFFFFF9F9),
    25: Color(0xFFFFF6F6),
    50: Color(0xFFFEECEB),
    100: Color(0xFFFAC5C1),
    200: Color(0xFFF8A9A3),
    300: Color(0xFFF5827A),
    400: Color(0xFFF36960),
    500: Color(0xFFF04438),
    600: Color(0xFFDA3E33),
    700: Color(0xFFAA3028),
  });

  static const sysOrange = MaterialColor(0xFFFB6514, {
    0: Color(0xFFFFFAF8),
    25: Color(0xFFFFF8F4),
    50: Color(0xFFFFF0E8),
    100: Color(0xFFFECFB6),
    200: Color(0xFFFDB893),
    300: Color(0xFFFC9862),
    400: Color(0xFFFC8443),
    500: Color(0xFFFB6514),
    600: Color(0xFFFF5C04),
    700: Color(0xFFB2480E),
  });

  // Alias Tokens
  // Background Colors
  static final bgDark = neutral.shade700;
  static const bgDarker = primaryBlackDefault;
  static final bgDanger = sysRed.shade600;
  static final bgDangerLight = sysRed.shade50;
  static final bgDisabled = neutral.shade400;
  static final bgInformation = sysBlue.shade600;
  static final bgInformationLight = sysBlue.shade50;
  static final bgLight = neutral.shade0;
  static final bgMedium = neutral.shade25;
  static final bgMediumDark = neutral.shade200;
  static const bgPrimaryBlackLight = primaryBlackLight;
  static const bgPrimaryGreen = primaryGreenDefault;
  static const bgPrimaryGreenDark = primaryGreenDark;
  static const bgPrimaryGreenLight = primaryGreenLight;
  static final bgSuccess = sysGreen.shade600;
  static final bgSuccessLight = sysGreen.shade50;
  static final bgSupportPLight = supPurple.shade50;
  static final bgSupportY = supYellow.shade600;
  static final bgSupportYLight = supYellow.shade50;
  static final bgWarning = sysOrange.shade600;
  static final bgWarningLight = sysOrange.shade50;

  // Border Colors
  static final borderDanger = sysRed.shade600;
  static const borderDarker = primaryBlackDefault;
  static final borderDark = neutral.shade500;
  static final borderDisabled = neutral.shade400;
  static final borderInformation = sysBlue.shade600;
  static final borderLight = neutral.shade0;
  static final borderMedium = neutral.shade25;
  static final borderMediumLight = neutral.shade100;
  static final borderMediumDark = neutral.shade200;
  static const borderPrimaryGreen = primaryGreenDefault;
  static const borderPrimaryGreenDark = primaryGreenDark;
  static final borderSuccess = sysGreen.shade600;
  static final borderWarning = sysOrange.shade600;
  static final borderYellow = supYellow.shade600;

  // Icon Colors
  static final iconDanger = sysRed.shade600;
  static const iconDefault = primaryBlackDefault;
  static final iconDisabled = neutral.shade400;
  static final iconInformation = sysBlue.shade600;
  static final iconLight = neutral.shade0;
  static final iconPlaceholder = neutral.shade400;
  static const iconPrimaryGreen = primaryGreenDefault;
  static const iconPrimaryGreenDark = primaryGreenDark;
  static final iconSecondary = neutral.shade600;
  static final iconSuccess = sysGreen.shade600;
  static final iconSupportP = supPurple.shade600;
  static final iconWarning = sysOrange.shade600;

  // Text Colors
  static final textDanger = sysRed.shade600;
  static const textDefault = primaryBlackDefault;
  static const textDefaultInverse = baseWhite;
  static final textDisabled = neutral.shade600;
  static final textInformation = sysBlue.shade600;
  static const textLink = primaryBlackDefault;
  static final textPlaceholder = neutral.shade800;
  static const textPrimaryGreen = primaryGreenDefault;
  static final textSecondary = neutral.shade900;
  static final textSuccess = sysGreen.shade600;
  static final textSupportP = supPurple.shade600;
  static final textSupportY = supYellow.shade600;
  static final textTertiary = neutral.shade500;
  static final textWarning = sysOrange.shade600;

  // Other Colors
  static const splashBackground = Color(0xFF1C1A17);
}
