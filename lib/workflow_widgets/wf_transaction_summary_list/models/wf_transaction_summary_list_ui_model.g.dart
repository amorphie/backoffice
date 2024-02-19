// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wf_transaction_summary_list_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WfTransactionSummaryListUiModel _$WfTransactionSummaryListUiModelFromJson(
        Map<String, dynamic> json) =>
    WfTransactionSummaryListUiModel(
      itemList: (json['itemList'] as List<dynamic>)
          .map((e) =>
              WfTransactionSummaryItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WfTransactionSummaryListUiModelToJson(
        WfTransactionSummaryListUiModel instance) =>
    <String, dynamic>{
      'itemList':
          WfTransactionSummaryListUiModel._itemListToJson(instance.itemList),
    };
