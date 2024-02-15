/*
 * neo_bank
 *
 * Created on 26/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';

extension ShadeExtension on MaterialColor {
  Color get shade0 => this[0]!;
  Color get shade25 => this[25]!;
}
