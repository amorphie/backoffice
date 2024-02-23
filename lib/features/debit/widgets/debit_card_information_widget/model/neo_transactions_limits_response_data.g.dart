// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_transactions_limits_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoTransactionsLimitsResponseData _$NeoTransactionsLimitsResponseDataFromJson(
        Map<String, dynamic> json) =>
    NeoTransactionsLimitsResponseData(
      (json['remainingLimitAmount'] as num?)?.toDouble(),
      (json['maxAllowedLimitAmount'] as num?)?.toDouble(),
      (json['amount'] as num?)?.toDouble(),
      json['currency'] as String?,
      json['limitType'] as int?,
      json['subLimitType'] as int?,
    );
