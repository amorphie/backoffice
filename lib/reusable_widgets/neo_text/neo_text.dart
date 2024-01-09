/*
 * neo_bank
 *
 * Created on 18/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoText extends StatefulWidget {
  const NeoText(
    this.data, {
    this.dataKey,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.padding,
    super.key,
  });

  final String? data;
  final String? dataKey;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final EdgeInsetsDirectional? padding;

  @override
  State<NeoText> createState() => _NeoTextState();
}

class _NeoTextState extends State<NeoText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data.isNotNull && widget.dataKey.isNotNull ? widget.data!.formatDataWithDataKey(context, widget.dataKey) : widget.data.orEmpty,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      textScaler: widget.textScaler,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
      selectionColor: widget.selectionColor,
    ).padding(widget.padding ?? EdgeInsetsDirectional.zero);
  }
}
