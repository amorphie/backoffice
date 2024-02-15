/*
 * 
 * Neobank.Client
 * 
 * Created on 30/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_annotation/json_annotation.dart';

class _Constants {
  static const cardApplicationEndpoint = "get-customer-name-for-debit";
}

@JsonEnum()
enum NeoCustomerNameDisplayMode {
  @JsonValue("cardApplication")
  cardApplication("cardApplication");

  final String displayMode;

  const NeoCustomerNameDisplayMode(this.displayMode);

  static const Map<String, NeoCustomerNameDisplayMode> _jsonValues = {
    'cardApplication': NeoCustomerNameDisplayMode.cardApplication,
  };

  static NeoCustomerNameDisplayMode fromJson(String json) {
    return _jsonValues[json] ?? NeoCustomerNameDisplayMode.cardApplication;
  }
}

extension NeoCustomerNameDisplayModeExtension on NeoCustomerNameDisplayMode {
  String getEndpoint() {
    switch (this) {
      case NeoCustomerNameDisplayMode.cardApplication:
        return _Constants.cardApplicationEndpoint;
    }
  }
}
