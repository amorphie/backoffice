import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/util/neo_assets.dart';

class _Constants {
  static const debitCard = 1;
  static const creditCard = 2;
  static const virtualCard = 20;
  static const physicalCard = 10;
}

enum NeoDebitCardType {
  debitCard(_Constants.debitCard, _Constants.physicalCard),
  creditCard(_Constants.creditCard, _Constants.physicalCard),
  debitVirtual(_Constants.debitCard, _Constants.virtualCard),
  creditCardVirtual(_Constants.creditCard, _Constants.virtualCard);

  final int cardType;
  final int type;

  const NeoDebitCardType(this.cardType, this.type);

  static NeoDebitCardType fromCardType(int cardType, int type) {
    return NeoDebitCardType.values.firstWhere((element) => element.cardType == cardType && element.type == type);
  }
}

extension NeoDebitCardTypeExtension on NeoDebitCardType {
  String getListTitle() {
    switch (this) {
      case NeoDebitCardType.debitCard:
        return LocalizationKey.debitCardCardListDebitCardSubtitle.loc();
      //STOPSHIP: Localization
      case NeoDebitCardType.creditCard:
        return "Kredi Kartları";
      case NeoDebitCardType.debitVirtual:
        return LocalizationKey.debitCardCardListVirtualCardSubtitle.loc();
      //STOPSHIP: Localization
      case NeoDebitCardType.creditCardVirtual:
        return LocalizationKey.debitCardCardListVirtualCardSubtitle.loc();
    }
  }

  // STOPSHIP: Apply neccesary localization
  String getCardName() {
    switch (this) {
      case NeoDebitCardType.debitCard:
        return LocalizationKey.debitCardCardListOnBankCardText.loc();
      case NeoDebitCardType.creditCard:
        return LocalizationKey.debitCardCardListOnBankCardText.loc();
      case NeoDebitCardType.debitVirtual:
        return LocalizationKey.debitCardCardListOnBankCardText.loc();
      case NeoDebitCardType.creditCardVirtual:
        return LocalizationKey.debitCardCardListOnBankCardText.loc();
    }
  }

  // STOPSHIP: Add necessary image urns
  String getCardImageUrn() {
    switch (this) {
      case NeoDebitCardType.debitCard:
        return NeoAssets.cardDebit.urn;
      case NeoDebitCardType.creditCard:
        return NeoAssets.cardDebit.urn;
      case NeoDebitCardType.debitVirtual:
        return NeoAssets.cardDebit.urn;
      case NeoDebitCardType.creditCardVirtual:
        return NeoAssets.cardDebit.urn;
    }
  }
}
