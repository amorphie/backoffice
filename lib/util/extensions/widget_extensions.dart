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
 */

import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  Widget padding(EdgeInsetsDirectional padding) => _withPadding(padding);

  Widget paddingAll(double value) => _withPadding(EdgeInsetsDirectional.all(value));

  Widget paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      _withPadding(EdgeInsetsDirectional.symmetric(vertical: vertical, horizontal: horizontal));

  Widget paddingOnly({double start = 0.0, double top = 0.0, double end = 0.0, double bottom = 0.0}) =>
      _withPadding(EdgeInsetsDirectional.only(start: start, top: top, end: end, bottom: bottom));

  Widget paddingSTEB(double start, double top, double end, double bottom) =>
      _withPadding(EdgeInsetsDirectional.fromSTEB(start, top, end, bottom));

  Widget _withPadding(EdgeInsetsGeometry padding) =>
      padding == EdgeInsets.zero ? this : Padding(padding: padding, child: this);
}
