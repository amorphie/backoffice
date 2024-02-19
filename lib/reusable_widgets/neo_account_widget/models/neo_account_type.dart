/*
 * 
 * Neobank.Client
 * 
 * Created on 23/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NeoAccountType {
  @JsonValue("checking")
  checking("checking"),

  @JsonValue("saving")
  saving("saving");

  final String accountType;

  const NeoAccountType(this.accountType);

  static const Map<String, NeoAccountType> _jsonValues = {
    "checking": NeoAccountType.checking,
    "saving": NeoAccountType.saving,
  };

  static NeoAccountType fromJson(String json) {
    return _jsonValues[json] ?? NeoAccountType.checking;
  }
}
