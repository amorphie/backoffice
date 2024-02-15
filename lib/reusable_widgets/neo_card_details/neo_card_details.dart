/*
 *
 *  neo_bank
 *
 *  Created on 04/01/2024.
 *  Copyright (c) 2024 Commencis. All rights reserved.
 *
 *  Save to the extent permitted by law, you may not use, copy, modify,
 *  distribute or create derivative works of this material or any part
 *  of it without the prior written consent of Commencis.
 *  Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/core/pages/usecases/get_loading_widget_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_sub_type.dart';
import 'package:backoffice/reusable_widgets/neo_amount_widget/neo_amount_widget.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/bloc/neo_card_details_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/bloc/neo_card_details_event.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/bloc/neo_card_details_state.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/model/neo_account_details_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/model/neo_card_details_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/network/neo_card_details_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

part 'widgets/neo_card_information_button.dart';

abstract class _Constants {
  static const dividerHeight = 1.0;
  static const temporaryClosureVerticalPadding = 18.0;
  static const temporaryClosureStatusCode = "GN";
}

class NeoCardDetails extends StatelessWidget {
  final String? transitionId;
  final NeoCardDetailsDisplayMode displayMode;
  final EdgeInsetsDirectional padding;

  const NeoCardDetails({
    this.transitionId,
    this.displayMode = NeoCardDetailsDisplayMode.defaultMode,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoCardDetailsBloc(networkManager: NeoCardDetailsNetworkManager())..add(const NeoCardDetailsEventFetchCardDetails()),
      child: BlocBuilder<NeoCardDetailsBloc, NeoCardDetailsState>(
        builder: (context, state) {
          return StreamBuilder<NeoDebitCardItemData>(
            stream: context.read<NeoCardDetailsBloc>().cardDetailsStream,
            builder: (context, cardDetailsSnapshot) {
              if (cardDetailsSnapshot.data.isNull) {
                // TODO: Show loading widget throughout the entire page where this widget is used
                return _buildLoadingWidget();
              } else {
                if (displayMode.shouldCallAccountDetailsService) {
                  // Build default and temporarily closed mode
                  if (cardDetailsSnapshot.data?.masterAccount?.iban != null) {
                    context.read<NeoCardDetailsBloc>().add(
                          NeoCardDetailsEventFetchAccountDetails(
                            iban: cardDetailsSnapshot.data?.masterAccount?.iban ?? "",
                          ),
                        );
                    return StreamBuilder<NeoAccountDetailsResponseData>(
                      stream: context.read<NeoCardDetailsBloc>().accountDetailsStream,
                      builder: (context, accountDetailsSnapshot) {
                        if (accountDetailsSnapshot.data.isNull) {
                          // TODO: Show loading widget throughout the entire page where this widget is used
                          return _buildLoadingWidget();
                        } else {
                          return _buildCardImageAndInformationBox(
                            cardNumber: cardDetailsSnapshot.data?.cardNumber.orEmpty.getMaskedCardNumber() ?? "",
                            shouldShowTemporaryClosure: cardDetailsSnapshot.data?.statusCode == _Constants.temporaryClosureStatusCode,
                            superAdditionalAccountLimit:
                                (accountDetailsSnapshot.data?.balance?.credits.isNotEmpty ?? false) ? accountDetailsSnapshot.data?.balance?.credits.first.availableAmount : null,
                            availableBalanceNonCredit: accountDetailsSnapshot.data?.balance?.availableBalanceNonCredit ?? 0,
                            accountName: "${accountDetailsSnapshot.data?.accountSubType?.getSubTypeName()} ${accountDetailsSnapshot.data?.balance?.currencyCode}",
                            currency: accountDetailsSnapshot.data?.balance?.currencyCode ?? "",
                          );
                        }
                      },
                    );
                  } else {
                    /// Could not find iban
                    return const SizedBox.shrink();
                  }
                } else if (displayMode.shouldCallTransactionCardDetailsService) {
                  // TODO: Call transaction card details stream builder
                  return const SizedBox.shrink();
                } else if (displayMode.shouldCallVirtualCardDetailsService) {
                  // TODO: Call virtual card details stream builder
                  return const SizedBox.shrink();
                } else {
                  return const SizedBox.shrink();
                }
              }
            },
          ).padding(padding);
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(height: NeoDimens.px64, child: GetLoadingWidgetUsecase().call(""));
  }

  Widget _buildCardImageAndInformationBox({
    required String cardNumber,
    required bool shouldShowTemporaryClosure,
    required double? superAdditionalAccountLimit,
    required double availableBalanceNonCredit,
    required String accountName,
    required String currency,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: NeoDimens.px24),
          child: _buildBigCardImage(cardNumber),
        ),
        _buildInformationBox(
          shouldShowTemporaryClosure: shouldShowTemporaryClosure,
          superAdditionalAccountLimit: superAdditionalAccountLimit,
          availableBalanceNonCredit: availableBalanceNonCredit,
          accountName: accountName,
          currency: currency,
        ),
      ],
    );
  }

  Widget _buildBigCardImage(String cardNumber) {
    return Stack(
      children: [
        NeoImage(
          // TODO: Get image urn from service as well
          imageUrn: NeoAssets.cardImages.urn,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(NeoRadius.px12),
            topRight: Radius.circular(NeoRadius.px12),
          ),
          borderColor: NeoColors.borderMediumLight,
          borderWidth: _Constants.dividerHeight,
        ),
        Positioned.fill(
          bottom: NeoDimens.px12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              NeoText(
                cardNumber.orEmpty,
                style: NeoTextStyles.labelFourteenBold,
              ),
            ],
          ).paddingSymmetric(horizontal: NeoDimens.px20),
        ),
      ],
    );
  }

  Widget _buildInformationBox({
    required bool shouldShowTemporaryClosure,
    required double? superAdditionalAccountLimit,
    required double availableBalanceNonCredit,
    required String accountName,
    required String currency,
  }) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: shouldShowTemporaryClosure
                ? BorderRadius.only(
                    topLeft: Radius.circular(NeoRadius.px20),
                    topRight: Radius.circular(NeoRadius.px20),
                  )
                : BorderRadius.circular(NeoRadius.px20),
            color: NeoColors.baseWhite,
            boxShadow: const [NeoShadows.xl],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvailableBalance(availableBalanceNonCredit, currency).paddingOnly(bottom: NeoDimens.px28),
              _buildTransactionInfoRow(
                LocalizationKey.debitCardDetailsCurrentBalanceLabel.loc(),
                availableBalanceNonCredit,
                currency,
              ).paddingOnly(bottom: NeoDimens.px12),
              if (superAdditionalAccountLimit.isNotNull)
                _buildTransactionInfoRow(
                  LocalizationKey.debitCardDetailsOverdraftLimitLabel.loc(),
                  superAdditionalAccountLimit.orZero,
                  currency,
                ).paddingOnly(bottom: NeoDimens.px12),
              _buildLinkedMainAccount(accountName).paddingOnly(bottom: NeoDimens.px24),
              _NeoCardInformationButton(transitionId: transitionId.orEmpty),
            ],
          ).paddingAll(NeoDimens.px24),
        ),
        if (shouldShowTemporaryClosure) _buildTemporaryClosureBottomBox(),
      ],
    );
  }

  Widget _buildTemporaryClosureBottomBox() {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: const [NeoShadows.xl],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(NeoRadius.px20),
          bottomRight: Radius.circular(NeoRadius.px20),
        ),
        color: NeoColors.bgWarningLight,
      ),
      child: Center(
        child: Row(
          children: [
            NeoIcon(iconUrn: NeoAssets.clock24px.urn, color: NeoColors.iconWarning).paddingOnly(end: NeoDimens.px12),
            NeoText(
              LocalizationKey.debitCardCardDetailsTemporaryClosedText.loc(),
              style: NeoTextStyles.bodyTwelveSemibold,
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: NeoDimens.px24, vertical: _Constants.temporaryClosureVerticalPadding),
    );
  }

  Widget _buildAvailableBalance(double availableBalance, String currency) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NeoText(
          LocalizationKey.debitCardDetailsAvailableBalanceLabel.loc(),
          style: NeoTextStyles.labelFourteenMedium,
        ).paddingOnly(bottom: NeoDimens.px8),
        NeoAmountWidget(
          amount: availableBalance,
          symbol: currency,
          style: NeoTextStyles.headlineThreeBold,
          precisionStyle: NeoTextStyles.titleSixteenMedium,
          symbolStyle: NeoTextStyles.titleSixteenMedium,
        ),
      ],
    );
  }

  Widget _buildTransactionInfoRow(String text, double amount, String currency) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeoText(text, style: NeoTextStyles.bodyTwelveMedium),
        NeoAmountWidget(
          amount: amount,
          symbol: currency,
          style: NeoTextStyles.bodyTwelveSemibold,
          precisionStyle: NeoTextStyles.bodyTwelveRegular,
          symbolStyle: NeoTextStyles.bodyTwelveRegular,
        ),
      ],
    );
  }

  // STOPSHIP: Apply localization
  Widget _buildLinkedMainAccount(String accountName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeoText("Bağlı Ana Hesap", style: NeoTextStyles.bodyTwelveMedium),
        NeoText(accountName.orEmpty, style: NeoTextStyles.bodyTwelveSemibold),
      ],
    );
  }
}
