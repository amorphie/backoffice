import 'package:flutter/material.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoAccordion extends StatelessWidget {
  final Widget title;
  final Widget items;
  final EdgeInsetsDirectional padding;

  const NeoAccordion({
    required this.title,
    required this.items,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsetsDirectional.zero,
        title: title,
        children: [items],
      ).padding(padding),
    );
  }
}
