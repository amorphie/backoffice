/*
 * neo_bank
 *
 * Created on 2/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_annotation/json_annotation.dart';

part 'wf_transaction_summary_item_model.g.dart';

@JsonSerializable()
class WfTransactionSummaryItemModel {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'value')
  final String value;

  WfTransactionSummaryItemModel({
    required this.title,
    required this.value,
  });

  factory WfTransactionSummaryItemModel.fromJson(Map<String, dynamic> json) =>
      _$WfTransactionSummaryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$WfTransactionSummaryItemModelToJson(this);
}
