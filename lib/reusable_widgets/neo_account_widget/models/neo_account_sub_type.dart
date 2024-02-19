/*
*
* neo_bank
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
import 'package:backoffice/core/localization/models/localization_key.dart';

@JsonEnum()
enum NeoAccountSubType {
  @JsonValue("MEVDFON")
  funded("MEVDFON"),

  @JsonValue("VDSZMVD")
  checking("VDSZMVD"),

  @JsonValue("VDLGLDR")
  on("VDLGLDR"),

  @JsonValue("VDLDOVE")
  exchangeRateProtected("VDLDOVE"),

  @JsonValue("VDLTLDE")
  foreignCurrencyExchangeRateProtected("VDLTLDE"),

  @JsonValue("VDLMEVD")
  saving("VDLMEVD");

  final String subType;

  const NeoAccountSubType(this.subType);

  static const Map<String, NeoAccountSubType> _jsonValues = {
    "MEVDFON": NeoAccountSubType.funded,
    "VDSZMVD": NeoAccountSubType.checking,
    "VDLGLDR": NeoAccountSubType.on,
    "VDLDOVE": NeoAccountSubType.exchangeRateProtected,
    "VDLTLDE": NeoAccountSubType.foreignCurrencyExchangeRateProtected,
    "VDLMEVD": NeoAccountSubType.saving,
  };

  static NeoAccountSubType fromJson(String json) {
    return _jsonValues[json] ?? NeoAccountSubType.funded;
  }

  static NeoAccountSubType fromSubType(String subType) {
    return NeoAccountSubType.values.firstWhere((element) => element.subType == subType);
  }
}

extension NeoAccountSubTypeExtension on NeoAccountSubType {
  String getSubTypeName() {
    switch (this) {
      case NeoAccountSubType.funded:
        return LocalizationKey.accountsFundedText.loc();
      case NeoAccountSubType.checking:
        return LocalizationKey.accountsCheckingText.loc();
      case NeoAccountSubType.on:
        return LocalizationKey.accountsOnText.loc();
      case NeoAccountSubType.exchangeRateProtected:
        return LocalizationKey.accountsExchangeRateProtectedText.loc();
      case NeoAccountSubType.foreignCurrencyExchangeRateProtected:
        return LocalizationKey.accountsForeignCurrencyExchangeRateProtectedText.loc();
      case NeoAccountSubType.saving:
        return LocalizationKey.accountsSavingText.loc();
    }
  }
}
