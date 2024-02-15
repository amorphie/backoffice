/*
 * 
 * neo_bank
 * 
 * Created on 05/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

part of '../neo_card_details.dart';

class _NeoCardInformationButton extends INeoButton {
  const _NeoCardInformationButton({super.transitionId});

  @override
  Widget Function(BuildContext context, NeoButtonState state) get childBuilder => (context, state) => InkWell(
        onTap: () => startTransition(context),
        child: _buildCardInformationButton(),
      );

  Widget _buildCardInformationButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            NeoIcon(iconUrn: NeoAssets.creditCard20px.urn).paddingOnly(end: NeoDimens.px8),
            NeoText(
              LocalizationKey.debitCardDetailsCardInformationTitle.loc(),
              style: NeoTextStyles.bodyTwelveSemibold,
            ),
          ],
        ),
        NeoIcon(iconUrn: NeoAssets.arrowRight20px.urn),
      ],
    );
  }
}
