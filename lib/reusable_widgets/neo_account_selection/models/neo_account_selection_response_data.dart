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
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_balance.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_sub_type.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_type.dart';

part 'neo_account_selection_response_data.g.dart';

abstract class _Constants {
  static const int defaultOrder = 1;
}

@JsonSerializable()
class NeoAccountSelectionResponseData {
  NeoAccountSelectionResponseData({
    required this.accountType,
    required this.accountSubType,
    required this.accountInternetName,
    required this.balance,
    required this.number,
    required this.suffix,
    required this.iban,
    required this.name,
    required this.currency,
    this.order = _Constants.defaultOrder,
  });

  @JsonKey(name: "accountType", includeToJson: false)
  final NeoAccountType? accountType;

  @JsonKey(name: "accountSubType", includeToJson: false)
  final NeoAccountSubType? accountSubType;

  @JsonKey(name: "accountInternetName", includeToJson: false)
  final String? accountInternetName;

  @JsonKey(name: "balance", includeToJson: false)
  final NeoAccountBalance? balance;

  @JsonKey(name: "number", includeToJson: false)
  final String? number;

  @JsonKey(name: "suffix", includeToJson: false)
  final String? suffix;

  @JsonKey(name: "iban")
  final String? iban;

  @JsonKey(name: "order", includeFromJson: false, includeToJson: true)
  final int order;

  @JsonKey(name: "name", includeToJson: false)
  final String? name;

  @JsonKey(name: "currency", includeToJson: false)
  final String? currency;

  factory NeoAccountSelectionResponseData.fromJson(Map<String, dynamic> json) => _$NeoAccountSelectionResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$NeoAccountSelectionResponseDataToJson(this);
}
