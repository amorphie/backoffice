import 'package:backoffice/util/neo_util.dart';

class _Constants {
  static const debitCode = "001";
  static const creditCardCode = "002";
  static const virtualCardCode = "003";
  static const additionalCardCode = "004";
}

enum NeoDebitCardLogoCode {
  debitCard(_Constants.debitCode),
  creditCard(_Constants.creditCardCode),
  virtualCard(_Constants.virtualCardCode),
  additionalCard(_Constants.additionalCardCode);

  final String logoCode;

  const NeoDebitCardLogoCode(this.logoCode);

  static NeoDebitCardLogoCode fromCardType(String cardType) {
    return NeoDebitCardLogoCode.values.firstWhere((element) => element.logoCode == cardType);
  }
}

extension NeoDebitCardLogoCodeExtension on NeoDebitCardLogoCode {
  String getCardImageUrn() {
    switch (this) {
      case NeoDebitCardLogoCode.debitCard:
        return NeoAssets.cardDebit.urn;
      case NeoDebitCardLogoCode.creditCard:
        return NeoAssets.cardDebit.urn;
      case NeoDebitCardLogoCode.virtualCard:
        return NeoAssets.cardDebit.urn;
      case NeoDebitCardLogoCode.additionalCard:
        return NeoAssets.cardCreditStandart.urn;
    }
  }
}
