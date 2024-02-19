/*
 * neo_bank
 *
 * Created on 5/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/cupertino.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_amount_widget/neo_amount_widget.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoAccountWidget extends StatelessWidget {
  final double amount;
  final String name;
  final String type;
  final String number;
  final String suffix;
  final String currency;
  final String? iconUrn;
  final bool isSelected;

  const NeoAccountWidget({
    required this.amount,
    required this.name,
    required this.type,
    required this.number,
    required this.suffix,
    required this.currency,
    this.iconUrn,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: NeoColors.baseWhite,
        borderRadius: BorderRadius.circular(NeoRadius.px8),
        border: Border.all(color: isSelected ? NeoColors.borderPrimaryGreenDark : NeoColors.borderMediumDark),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              NeoText(
                name,
                style: NeoTextStyles.labelFourteenSemibold,
              ).paddingOnly(bottom: NeoDimens.px4),
              NeoText(
                "$type $currency ${LocalizationKey.accountsAccountText.loc()} - $number - $suffix",
                style: NeoTextStyles.bodyElevenMedium.apply(color: NeoColors.textSecondary),
              ).paddingOnly(bottom: NeoDimens.px4),
              _buildBalanceText(),
            ],
          ),
          if (iconUrn != null)
            NeoIcon(
              iconUrn: iconUrn!,
              color: NeoColors.textPlaceholder,
            ),
        ],
      ).paddingSymmetric(horizontal: NeoDimens.px16, vertical: NeoDimens.px12),
    );
  }

  // STOPSHIP: Currency will be updated according to analyze
  Widget _buildBalanceText() {
    return Row(
      children: [
        Text(
          "${LocalizationKey.accountsAccountBalanceLabel.loc()} ",
          style: NeoTextStyles.bodyTwelveMedium,
        ),
        NeoAmountWidget(
          amount: amount,
          symbol: currency,
          style: NeoTextStyles.bodyTwelveSemibold,
          precisionStyle: NeoTextStyles.bodyTwelveMedium,
          symbolStyle: NeoTextStyles.bodyTwelveMedium,
        ),
      ],
    );
  }
}
