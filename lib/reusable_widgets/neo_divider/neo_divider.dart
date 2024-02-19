import 'package:flutter/material.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;
  final EdgeInsetsDirectional padding;

  const NeoDivider({
    super.key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.padding = EdgeInsetsDirectional.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      endIndent: endIndent,
      indent: indent,
      thickness: thickness,
      color: color,
    ).padding(padding);
  }
}
