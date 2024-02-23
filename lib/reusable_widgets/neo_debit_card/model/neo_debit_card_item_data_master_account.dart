import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/features/debit/widgets/debit_card_information_widget/model/neo_transactions_limits_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/model/neo_account_details_response_data.dart';

part 'neo_debit_card_item_data_master_account.g.dart';

@JsonSerializable(createToJson: false)
class NeoDebitCardItemDataMasterAccount extends Equatable {
  @JsonKey(name: "iban")
  final String? iban;
  @JsonKey(name: "number")
  final int? number;
  @JsonKey(name: "branch")
  final int? branch;
  @JsonKey(name: "suffix")
  final int? suffix;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "balance")
  final double? balance;
  @JsonKey(name: "accountDetails")
  final NeoAccountDetailsResponseData? accountDetails;
  @JsonKey(name: "transactionLimits")
  final List<NeoTransactionsLimitsResponseData?>? transactionLimits;

  const NeoDebitCardItemDataMasterAccount({
    this.iban,
    this.number,
    this.branch,
    this.suffix,
    this.currency,
    this.balance,
    this.accountDetails,
    this.transactionLimits,
  });

  factory NeoDebitCardItemDataMasterAccount.fromJson(Map<String, dynamic> json) => _$NeoDebitCardItemDataMasterAccountFromJson(json);

  @override
  List<Object?> get props => [iban, number, branch, suffix, currency, balance];
}
