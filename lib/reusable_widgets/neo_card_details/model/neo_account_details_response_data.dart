/*
 * 
 * neo_bank
 * 
 * Created on 26/01/2024.
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

part 'neo_account_details_response_data.g.dart';

@JsonSerializable(createToJson: false)
class NeoAccountDetailsResponseData {
  @JsonKey(name: "accountSubType")
  final NeoAccountSubType? accountSubType;
  @JsonKey(name: "balance")
  final NeoAccountBalance? balance;

  NeoAccountDetailsResponseData({
    this.accountSubType,
    this.balance,
  });

  factory NeoAccountDetailsResponseData.fromJson(Map<String, dynamic> json) => _$NeoAccountDetailsResponseDataFromJson(json);
}
