/*
 *
 *  neo_bank
 *
 *  Created on 04/01/2024.
 *  Copyright (c) 2024 Commencis. All rights reserved.
 *
 *  Save to the extent permitted by law, you may not use, copy, modify,
 *  distribute or create derivative works of this material or any part
 *  of it without the prior written consent of Commencis.
 *  Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NeoCardDetailsDisplayMode {
  @JsonValue('default')
  defaultMode,
  @JsonValue('transactions')
  transactions,
  @JsonValue('virtual')
  virtual;

  static const Map<String, NeoCardDetailsDisplayMode> _jsonValues = {
    'default': NeoCardDetailsDisplayMode.defaultMode,
    'transactions': NeoCardDetailsDisplayMode.transactions,
    'virtual': NeoCardDetailsDisplayMode.virtual,
  };

  static NeoCardDetailsDisplayMode fromJson(String json) {
    return _jsonValues[json] ?? NeoCardDetailsDisplayMode.defaultMode;
  }
}

// STOPSHIP: Update this extension when the services are finalized
extension NeoCardDetailsDisplayModeExtension on NeoCardDetailsDisplayMode {
  bool get shouldCallAccountDetailsService {
    return this == NeoCardDetailsDisplayMode.defaultMode;
  }

  bool get shouldCallTransactionCardDetailsService {
    return this == NeoCardDetailsDisplayMode.transactions;
  }

  bool get shouldCallVirtualCardDetailsService {
    return this == NeoCardDetailsDisplayMode.virtual;
  }
}
