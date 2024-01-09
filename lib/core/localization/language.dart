/*
 * neo_bank
 *
 * Created on 4/10/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';

enum Language {
  turkish("tr"),
  english("en"),
  arabic("ar");

  final String languageCode;

  const Language(this.languageCode);

  factory Language.fromString(String languageCode) {
    return values.firstWhere(
      (e) => e.languageCode == languageCode,
      orElse: () => defaultLanguage,
    );
  }

  static Language get defaultLanguage => Language.english;

  Locale get locale => Locale(languageCode);
}
