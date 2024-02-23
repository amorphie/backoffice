import 'package:json_annotation/json_annotation.dart';

part 'neo_transactions_limits_response_data.g.dart';

@JsonSerializable(createToJson: false)
class NeoTransactionsLimitsResponseData {
  @JsonKey(name: "remainingLimitAmount")
  final double? remainingLimitAmount;
  @JsonKey(name: "maxAllowedLimitAmount")
  final double? maxAllowedLimitAmount;
  @JsonKey(name: "amount")
  final double? amount;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "limitType")
  final int? limitType;
  @JsonKey(name: "subLimitType")
  final int? subLimitType;

  NeoTransactionsLimitsResponseData(
    this.remainingLimitAmount,
    this.maxAllowedLimitAmount,
    this.amount,
    this.currency,
    this.limitType,
    this.subLimitType,
  );

  factory NeoTransactionsLimitsResponseData.fromJson(Map<String, dynamic> json) =>
      _$NeoTransactionsLimitsResponseDataFromJson(json);
}
