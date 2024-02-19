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

import 'package:backoffice/core/core_widgets/neo_toast/models/neo_toast_type.dart';

class NeoToastModal {
  final String message;

  final NeoToastType type;

  NeoToastModal({required this.message, required this.type});
}
