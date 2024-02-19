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

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

mixin NeoTransitional on Widget {
  String? get transitionId;

  @visibleForOverriding
  Map<String, dynamic> getDefaultTransitionParams(BuildContext context) => {};

  Future startTransition(BuildContext context, {Map<String, dynamic>? transitionBody});
}
