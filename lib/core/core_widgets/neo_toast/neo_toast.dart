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

import 'package:flutter/material.dart';
import 'package:backoffice/core/core_widgets/neo_toast/models/neo_toast_model.dart';
import 'package:backoffice/core/core_widgets/neo_toast/models/neo_toast_type.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoToast extends StatelessWidget {
  final NeoToastModal model;

  const NeoToast(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: model.type.backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NeoIcon(iconUrn: model.type.iconUrn, width: NeoDimens.px20),
          Expanded(
            child: NeoText(
              model.message,
              style: NeoTextStyles.bodyFourteenMedium.copyWith(color: NeoColors.textDefaultInverse),
            ).paddingOnly(start: NeoDimens.px8),
          ),
        ],
      ).paddingAll(NeoDimens.px16),
    );
  }
}
