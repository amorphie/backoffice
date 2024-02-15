/*
 * neo_bank
 *
 * Created on 23/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:backoffice/util/constants/neo_constants.dart';

abstract class BaseShowPopupUseCase {
  @nonVirtual
  Future<dynamic> call(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: NeoDimens.px24, vertical: NeoDimens.px24),
        alignment: Alignment.bottomCenter,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NeoRadius.px16)),
        backgroundColor: NeoColors.textDefaultInverse,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: build(context),
      ),
    );
  }

  @visibleForOverriding
  Widget build(BuildContext context);
}
