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
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoText extends StatefulWidget {
  const NeoText(
    this.data, {
    this.dataKey,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.textColor,
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
  final Color? textColor;
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
  String? get data => widget.data.orEmpty.isNotEmpty ? localize(widget.data!) : widget.data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data.isNotNull && widget.dataKey.isNotNull ? data!.formatDataWithDataKey(context, widget.dataKey) : data.orEmpty,
      style: widget.style?.apply(color: widget.textColor),
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
