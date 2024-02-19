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

import 'package:flutter/cupertino.dart';

abstract class _Constants {
  static const defaultShadowColor = Color.fromRGBO(45, 42, 38, 0.12);
  static const translucentShadowColor = Color.fromRGBO(45, 42, 38, 0.08);
}

abstract class NeoShadows {
  static const xs = BoxShadow(offset: Offset(0, 1), blurRadius: 2, color: _Constants.defaultShadowColor);
  static const s = BoxShadow(offset: Offset(0, 2), blurRadius: 4, color: _Constants.defaultShadowColor);
  static const m = BoxShadow(offset: Offset(0, 2), blurRadius: 8, color: _Constants.defaultShadowColor);
  static const l = BoxShadow(offset: Offset(0, 4), blurRadius: 16, color: _Constants.defaultShadowColor);
  static const xl = BoxShadow(offset: Offset(0, 4), blurRadius: 28, color: _Constants.translucentShadowColor);
}
