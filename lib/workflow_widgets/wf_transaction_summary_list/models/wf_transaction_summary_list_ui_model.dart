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
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/models/wf_transaction_summary_item_model.dart';

part 'wf_transaction_summary_list_ui_model.g.dart';

abstract class _Constants {
  static const jsonKeyItemList = "itemList";
}

@JsonSerializable()
class WfTransactionSummaryListUiModel {
  @JsonKey(name: _Constants.jsonKeyItemList, toJson: _itemListToJson)
  final List<WfTransactionSummaryItemModel> itemList;

  WfTransactionSummaryListUiModel({required this.itemList});

  factory WfTransactionSummaryListUiModel.fromJson(Map<String, dynamic> json) => _$WfTransactionSummaryListUiModelFromJson(json);

  Map<String, dynamic> toJson() => _$WfTransactionSummaryListUiModelToJson(this);

  static List<Map<String, dynamic>> _itemListToJson(List<WfTransactionSummaryItemModel> itemList) {
    return itemList.map((item) => item.toJson()).toList();
  }
}
