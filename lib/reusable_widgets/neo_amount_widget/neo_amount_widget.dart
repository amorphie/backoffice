/*
 * neo_bank
 *
 * Created on 7/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/localization/language.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const String currencyFormat = "#,##0.##";
}

class NeoAmountWidget extends StatelessWidget {
  final double amount;
  final String? symbol;
  final int precision;

  final TextStyle style;
  final TextStyle precisionStyle;
  final TextStyle symbolStyle;

  const NeoAmountWidget({
    required this.amount,
    this.style = NeoTextStyles.defaultTextStyle,
    this.precisionStyle = NeoTextStyles.defaultTextStyle,
    this.symbolStyle = NeoTextStyles.defaultTextStyle,
    super.key,
    this.symbol,
    this.precision = 2,
  });

  @override
  Widget build(BuildContext context) {
    final formattedAmount = _formatter.format(amount);
    final precisionIndex = formattedAmount.length - (precision + 1);
    final integerPart = formattedAmount.substring(0, precisionIndex);
    final precisionPart = formattedAmount.substring(precisionIndex, formattedAmount.length);

    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: integerPart, style: style),
          TextSpan(text: precisionPart, style: precisionStyle),
          if (symbol.isNotNull) TextSpan(text: " $symbol", style: symbolStyle),
        ],
      ),
    );
  }

  NumberFormat get _formatter => NumberFormat.currency(
        locale: LocalizationBloc.currentLanguage?.languageCode ?? Language.defaultLanguage.languageCode,
        customPattern: _Constants.currencyFormat,
        symbol: symbol,
        decimalDigits: precision,
      );
}
