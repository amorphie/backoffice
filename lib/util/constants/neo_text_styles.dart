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

abstract class NeoTextStyles {
  static const String fontFamily = 'Montserrat';

  static const TextStyle defaultTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    fontSize: 14.0,
    color: NeoColors.textDefault,
    letterSpacing: 0,
  );

  /// H1
  static final headlineOneBold = defaultTextStyle.copyWith(fontSize: 36.0, fontWeight: FontWeight.w700);
  static final headlineOneSemibold = defaultTextStyle.copyWith(fontSize: 36.0, fontWeight: FontWeight.w600);
  static final headlineOneMedium = defaultTextStyle.copyWith(fontSize: 36.0, fontWeight: FontWeight.w500);
  static final headlineOneRegular = defaultTextStyle.copyWith(fontSize: 36.0, fontWeight: FontWeight.w400);

  /// H2
  static final headlineTwoBold = defaultTextStyle.copyWith(fontSize: 32.0, fontWeight: FontWeight.w700);
  static final headlineTwoSemibold = defaultTextStyle.copyWith(fontSize: 32.0, fontWeight: FontWeight.w600);
  static final headlineTwoMedium = defaultTextStyle.copyWith(fontSize: 32.0, fontWeight: FontWeight.w500);
  static final headlineTwoRegular = defaultTextStyle.copyWith(fontSize: 32.0, fontWeight: FontWeight.w400);

  /// H3
  static final headlineThreeBold = defaultTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w700);
  static final headlineThreeSemibold = defaultTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w600);
  static final headlineThreeMedium = defaultTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w500);
  static final headlineThreeRegular = defaultTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w400);

  /// T24
  static final titleTwentyFourBold = defaultTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w700);
  static final titleTwentyFourSemibold = defaultTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w600);
  static final titleTwentyFourMedium = defaultTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w500);
  static final titleTwentyFourRegular = defaultTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w400);

  /// T20
  static final titleTwentyBold = defaultTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.w700);
  static final titleTwentySemibold = defaultTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.w600);
  static final titleTwentyMedium = defaultTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.w500);
  static final titleTwentyRegular = defaultTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.w400);

  /// T18
  static final titleEighteenBold = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w700);
  static final titleEighteenSemibold = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600);
  static final titleEighteenMedium = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w500);
  static final titleEighteenRegular = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);

  /// T16
  static final titleSixteenBold = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w700);
  static final titleSixteenSemibold = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600);
  static final titleSixteenMedium = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w500);
  static final titleSixteenRegular = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w400);

  /// T12
  static final titleTwelveBold = defaultTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w700);
  static final titleTwelveSemibold = defaultTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w600);
  static final titleTwelveMedium = defaultTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w500);

  /// L18
  static final labelEighteenBold = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w700);
  static final labelEighteenSemibold = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600);
  static final labelEighteenMedium = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w500);
  static final labelEighteenRegular = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);

  /// L16
  static final labelSixteenBold = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w700);
  static final labelSixteenSemibold = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600);
  static final labelSixteenMedium = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w500);
  static final labelSixteenRegular = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w400);

  /// L14
  static final labelFourteenBold = defaultTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w700);
  static final labelFourteenSemibold = defaultTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w600);
  static final labelFourteenMedium = defaultTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w500);
  static final labelFourteenRegular = defaultTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);

  /// B18
  static final bodyEighteenBold = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w700);
  static final bodyEighteenSemibold = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w600);
  static final bodyEighteenMedium = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w500);
  static final bodyEighteenRegular = defaultTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);

  /// B16
  static final bodySixteenBold = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w700);
  static final bodySixteenSemibold = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600);
  static final bodySixteenMedium = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w500);
  static final bodySixteenRegular = defaultTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w400);

  /// B14
  static final bodyFourteenBold = defaultTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w700);
  static final bodyFourteenSemibold = defaultTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w600);
  static final bodyFourteenMedium = defaultTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w500);
  static final bodyFourteenRegular = defaultTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);

  /// B12
  static final bodyTwelveBold = defaultTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w700);
  static final bodyTwelveSemibold = defaultTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w600);
  static final bodyTwelveMedium = defaultTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w500);
  static final bodyTwelveRegular = defaultTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w400);
}
