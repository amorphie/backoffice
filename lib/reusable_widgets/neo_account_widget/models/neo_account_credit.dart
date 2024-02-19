/*
 * neo_bank
 *
 * Created on 7/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

part 'neo_account_credit.g.dart';

@JsonSerializable()
class NeoAccountCredit {
  @JsonKey(name: "availableAmount")
  final double? availableAmount;

  NeoAccountCredit({
    this.availableAmount,
  });

  factory NeoAccountCredit.fromJson(Map<String, dynamic> json) => _$NeoAccountCreditFromJson(json);
}
