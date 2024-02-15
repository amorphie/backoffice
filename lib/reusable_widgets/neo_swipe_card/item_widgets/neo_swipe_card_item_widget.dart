import 'package:flutter/material.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoSwipeCardItemWidget extends StatelessWidget {
  final String dataValue;
  final Widget card;
  final EdgeInsetsDirectional padding;

  const NeoSwipeCardItemWidget({
    required this.card,
    this.dataValue = "",
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return card.padding(padding);
  }
}
