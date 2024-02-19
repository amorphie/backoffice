import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data_master_account.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_logo_code.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_type.dart';

part 'neo_debit_card_item_data.g.dart';

class _Constants {
  static const debitCard = 1;
  static const defaultLogoCode = "001";
  static const defaultCardType = 10;
}

@JsonSerializable(createToJson: false)
class NeoDebitCardItemData extends Equatable {
  @JsonKey(name: "cardNumber")
  final String? cardNumber;
  @JsonKey(name: "issuedToName")
  final String? issuedToName;
  @JsonKey(name: "type")
  final int? type;
  @JsonKey(name: "cardType", defaultValue: _Constants.debitCard)
  final int cardType;
  @JsonKey(name: "masterAccount")
  final NeoDebitCardItemDataMasterAccount? masterAccount;
  @JsonKey(name: "statusCode")
  final String? statusCode;
  @JsonKey(name: "statusName")
  final String? statusName;
  @JsonKey(name: "embossName")
  final String? embossName;
  @JsonKey(name: "logoCode")
  final String? logoCode;

  const NeoDebitCardItemData({
    required this.cardType,
    this.cardNumber,
    this.issuedToName,
    this.type,
    this.masterAccount,
    this.statusCode,
    this.statusName,
    this.embossName,
    this.logoCode,
  });

  factory NeoDebitCardItemData.fromJson(Map<String, dynamic> json) => _$NeoDebitCardItemDataFromJson(json);

  @override
  List<Object?> get props => [cardType, issuedToName, type, masterAccount, statusCode, statusName, embossName, logoCode];
}

extension NeoDebitCardItemDataExtension on NeoDebitCardItemData {
  NeoDebitCardLogoCode getLogoType() {
    return NeoDebitCardLogoCode.fromCardType(logoCode ?? _Constants.defaultLogoCode);
  }

  NeoDebitCardType getCardType() {
    return NeoDebitCardType.fromCardType(cardType, type ?? _Constants.defaultCardType);
  }

  String getCardName() {
    switch (NeoDebitCardType.fromCardType(cardType, type ?? _Constants.defaultCardType)) {
      case NeoDebitCardType.debitCard:
        return LocalizationKey.debitCardCardListOnBankCardText.loc();
      //STOPSHIP LOCALIZATION
      case NeoDebitCardType.creditCard:
        return LocalizationKey.debitCardCardListOnBankCardText.loc();
      case NeoDebitCardType.debitVirtual:
        return LocalizationKey.debitCardCardListOnBankCardText.loc();
      //STOPSHIP LOCALIZATION
      case NeoDebitCardType.creditCardVirtual:
        return LocalizationKey.debitCardCardListOnBankCardText.loc();
    }
  }

  String getAmountTitle() {
    switch (getCardType()) {
      case NeoDebitCardType.debitCard:
        return LocalizationKey.debitCardCardListTotalBalanceText.loc();
      //STOPSHIP: LOCALIZATION KEY FOR CREDIT KART
      case NeoDebitCardType.creditCard:
        return LocalizationKey.debitCardCardListTotalBalanceText.loc();
      case NeoDebitCardType.debitVirtual:
        return LocalizationKey.debitCardCardListTotalBalanceText.loc();
      //STOPSHIP: LOCALIZATION KEY FOR CREDIT KART
      case NeoDebitCardType.creditCardVirtual:
        return LocalizationKey.debitCardCardListTotalBalanceText.loc();
    }
  }
}
