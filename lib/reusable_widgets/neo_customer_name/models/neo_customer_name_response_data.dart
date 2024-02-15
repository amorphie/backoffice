/*
 * 
 * Neobank.Client
 * 
 * Created on 29/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_annotation/json_annotation.dart';

part 'neo_customer_name_response_data.g.dart';

@JsonSerializable()
class NeoCustomerNameResponseData {
  NeoCustomerNameResponseData({
    required this.firstLines,
  });

  @JsonKey(name: "firstLines", defaultValue: [])
  final List<String> firstLines;

  factory NeoCustomerNameResponseData.fromJson(Map<String, dynamic> json) =>
      _$NeoCustomerNameResponseDataFromJson(json);
}
