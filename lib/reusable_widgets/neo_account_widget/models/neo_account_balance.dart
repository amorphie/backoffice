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
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_credit.dart';

part 'neo_account_balance.g.dart';

@JsonSerializable()
class NeoAccountBalance {
  NeoAccountBalance({
    required this.credits,
    this.availableBalance,
    this.availableBalanceNonCredit,
    this.balance,
    this.currencyCode,
  });

  @JsonKey(name: "availableBalance")
  final double? availableBalance;

  @JsonKey(name: "availableBalanceNonCredit")
  final double? availableBalanceNonCredit;

  @JsonKey(name: "balance")
  final double? balance;

  @JsonKey(name: "currencyCode")
  final String? currencyCode;

  @JsonKey(name: "credits", defaultValue: [])
  final List<NeoAccountCredit> credits;

  factory NeoAccountBalance.fromJson(Map<String, dynamic> json) => _$NeoAccountBalanceFromJson(json);
}
