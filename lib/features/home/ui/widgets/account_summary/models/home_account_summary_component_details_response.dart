import 'package:json_annotation/json_annotation.dart';

part 'home_account_summary_component_details_response.g.dart';

@JsonSerializable(createToJson: false)
class HomeAccountSummaryComponentDetailsResponse {
  @JsonKey(name: "availableLimit", defaultValue: "")
  final String availableLimit;

  @JsonKey(name: "totalLimit", defaultValue: "")
  final String totalLimit;

  @JsonKey(name: "currentDebt", defaultValue: "")
  final String currentDebt;

  @JsonKey(name: "accountOpeningDate", defaultValue: "")
  final String accountOpeningDate;

  @JsonKey(name: "monthlyInterestRate", defaultValue: "")
  final String monthlyInterestRate;

  @JsonKey(name: "yearlyInterestRate", defaultValue: "")
  final String yearlyInterestRate;

  factory HomeAccountSummaryComponentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeAccountSummaryComponentDetailsResponseFromJson(json);

  HomeAccountSummaryComponentDetailsResponse({
    required this.availableLimit,
    required this.totalLimit,
    required this.currentDebt,
    required this.accountOpeningDate,
    required this.monthlyInterestRate,
    required this.yearlyInterestRate,
  });
}
