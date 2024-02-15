/*
 * neo_bank
 *
 * Created on 30/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

class NeoIconButton extends StatelessWidget {
  final String iconUrn;
  final Color? color;
  final String? widgetEventKey;
  final EdgeInsetsDirectional padding;

  const NeoIconButton({
    required this.iconUrn,
    this.color,
    this.padding = EdgeInsetsDirectional.zero,
    this.widgetEventKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: NeoIcon(iconUrn: iconUrn, color: color),
      onPressed: () {
        if (!widgetEventKey.isNullOrBlank) {
          getIt.get<NeoWidgetEventBus>().addEvent(NeoWidgetEvent(eventId: widgetEventKey!, data: DateTime.now()));
        }
      },
      padding: padding,
    );
  }
}
