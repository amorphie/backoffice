import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_key.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';
import 'package:backoffice/reusable_widgets/neo_amount_widget/neo_amount_widget.dart';
import 'package:backoffice/reusable_widgets/neo_badge/model/neo_badge_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_badge/neo_badge.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_logo_code.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_type.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const smallCardImageWidth = 68.0;
  static const smallCardImageHeight = 42.0;
  static const maxLines = 2;
}

class NeoDebitCard extends StatelessWidget {
  final NeoDebitCardItemData itemData;
  final String badgeText;
  final bool showNewBadge;
  final EdgeInsetsDirectional padding;
  final String? navigationPath;

  const NeoDebitCard({
    required this.itemData,
    this.badgeText = "",
    this.showNewBadge = false,
    this.padding = EdgeInsetsDirectional.zero,
    this.navigationPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _buildComponent().padding(padding);
  }

  //STOPSHIP: Navigate to related screen and write necessary data to cache
  Widget _buildComponent() {
    return GestureDetector(
      onTap: () {
        _writeCardDataToCache();
        if (navigationPath != null && navigationPath!.isNotEmpty) {
          NeoWidgetEventKeys.globalNavigationPush.sendEvent(data: navigationPath);
        }
      },
      child: _buildCard(),
    );
  }

  void _writeCardDataToCache() {
    GetIt.I<NeoParameterManager>().writeToCache(NeoParameterKey.debitCardNameCachedKey, itemData.getCardName());
    GetIt.I<NeoParameterManager>().writeToCache(NeoParameterKey.debitCardIdCachedKey, itemData.cardNumber);
    GetIt.I<NeoParameterManager>().writeToCache(NeoParameterKey.debitCardTypeCachedKey, itemData.getCardType());
    GetIt.I<NeoParameterManager>().writeToCache(NeoParameterKey.debitCardStatusCodeCachedKey, itemData.statusCode);
  }

  //STOPSHIP: It will be changed after the analysis is updated
  Widget _buildCard() {
    switch (itemData.getCardType()) {
      case NeoDebitCardType.creditCard:
        return _buildCardView();
      case NeoDebitCardType.debitCard:
        return _buildCardView();
      case NeoDebitCardType.debitVirtual:
        return _buildCardView();
      case NeoDebitCardType.creditCardVirtual:
        return _buildCardView();
    }
  }

  Widget _buildCardView() {
    return DecoratedBox(
      decoration: _buildDecoration(),
      child: _buildCardColumn().paddingAll(NeoDimens.px24),
    );
  }

  //STOPSHIP Waiting analyze

  Widget _buildCardColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCardImageAndName(),
        _buildDetailsColumn(),
      ],
    );
  }

  Widget _buildCardImageAndName() {
    final row = [
      _buildCardImage().paddingOnly(end: NeoDimens.px16),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeoText(
              itemData.getCardName(),
              style: NeoTextStyles.bodyFourteenSemibold,
              maxLines: _Constants.maxLines,
              overflow: TextOverflow.clip,
            ),
            NeoText(
              itemData.cardNumber.orEmpty.getMaskedCardNumber(),
              style: NeoTextStyles.bodyTwelveMedium.apply(color: NeoColors.textSecondary),
              maxLines: _Constants.maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ];

    if (showNewBadge) {
      row
        ..add(const Spacer())
        ..add(_buildDigitalBadge());
    }

    return Row(
      children: row,
    );
  }

  Widget _buildBalanceText() {
    return NeoAmountWidget(
      amount: itemData.masterAccount?.balance ?? 0,
      symbol: itemData.masterAccount?.currency,
      style: NeoTextStyles.bodyTwelveSemibold,
      precisionStyle: NeoTextStyles.bodyTwelveRegular,
      symbolStyle: NeoTextStyles.bodyTwelveRegular,
    );
  }

  Widget _buildCardImage() {
    return NeoImage(
      imageUrn: itemData.getLogoType().getCardImageUrn(),
      width: _Constants.smallCardImageWidth,
      height: _Constants.smallCardImageHeight,
    );
  }

  Widget _buildDigitalBadge() {
    return NeoBadge(
      text: badgeText,
      displayMode: NeoBadgeDisplayMode.blackHighlighted,
      padding: const EdgeInsetsDirectional.all(NeoDimens.px2),
    );
  }

  Widget _buildDetailsColumn() {
    return _buildAmountInfoRow();
  }

  Widget _buildAmountInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: NeoText(
            itemData.getAmountTitle(),
            style: NeoTextStyles.bodyTwelveMedium.copyWith(color: NeoColors.textSecondary),
          ),
        ),
        Flexible(child: _buildBalanceText()),
      ],
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(NeoRadius.px16),
      color: NeoColors.baseWhite,
      boxShadow: const [NeoShadows.xl],
    );
  }
}
