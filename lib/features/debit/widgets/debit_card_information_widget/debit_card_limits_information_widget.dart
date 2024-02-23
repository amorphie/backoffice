import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/core/pages/usecases/get_loading_widget_usecase.dart';
import 'package:backoffice/features/debit/widgets/debit_card_information_widget/bloc/debit_card_limit_information_widget_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_sub_type.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/network/neo_card_details_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_divider/neo_divider.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constant {
  static const atmLimitType = 30;
  static const postLimitType = 10;
}

class DebitCardLimitInformationWidget extends StatelessWidget {
  final EdgeInsetsDirectional padding;

  const DebitCardLimitInformationWidget({super.key, this.padding = EdgeInsetsDirectional.zero});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DebitCardLimitInformationWidgetBloc(networkManager: NeoCardDetailsNetworkManager())
        ..add(
          const DebitCardLimitInformationWidgetEventFetchCardDetails(),
        ),
      child: BlocBuilder<DebitCardLimitInformationWidgetBloc, DebitCardLimitInformationWidgetState>(
        builder: (context, state) {
          return StreamBuilder<NeoDebitCardItemData>(
            stream: context.read<DebitCardLimitInformationWidgetBloc>().cardDetailsStream,
            builder: (context, cardDetailsSnapshot) {
              if (cardDetailsSnapshot.data.isNull) {
                return _buildLoadingWidget();
              } else {
                return Column(
                  children: [
                    NeoDivider(color: NeoColors.borderMediumLight).paddingOnly(bottom: NeoDimens.px8),
                    buildCardInformationsWidget(cardDetailsSnapshot),
                    buildTransactionsLimitsWidget(cardDetailsSnapshot),
                    NeoDivider(color: NeoColors.borderMediumLight),
                  ],
                ).padding(padding);
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(height: NeoDimens.px64, child: GetLoadingWidgetUsecase().call(""));
  }

  Widget buildTransactionsLimitsWidget(
    AsyncSnapshot<NeoDebitCardItemData> cardDetailsSnapshot,
  ) {
    final widgetList = <Widget>[];

    cardDetailsSnapshot.data?.masterAccount?.transactionLimits?.reversed.forEach((element) {
      if (element?.limitType == _Constant.atmLimitType) {
        widgetList.add(
          buildInformationWidget(
            LocalizationKey.debitCardDetailsAtmMaxLimitLabel.loc(),
            "${element?.remainingLimitAmount} ${element?.currency}",
          ),
        );
      } else {
        if (element?.limitType == _Constant.postLimitType) {
          widgetList.add(
            buildInformationWidget(
              LocalizationKey.debitCardDetailsPosMaxLimitLabel.loc(),
              "${element?.remainingLimitAmount} ${element?.currency}",
              shouldShowDivider: false,
            ),
          );
        }
      }
    });

    return Column(
      children: widgetList,
    );
  }

  Widget buildCardInformationsWidget(
    AsyncSnapshot<NeoDebitCardItemData> cardDetailsSnapshot,
  ) {
    return Column(
      children: [
        buildInformationWidget(
          LocalizationKey.debitCardInformationNameOnCardTitle.loc(),
          cardDetailsSnapshot.data?.embossName,
        ),
        buildInformationWidget(
          LocalizationKey.debitCardDetailsConnectedAccountLabel.loc(),
          "${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.accountSubType?.getSubTypeName()} ${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.currencyCode}",
        ),
        buildInformationWidget(
          LocalizationKey.debitCardInformationAccountNumberLabel.loc(),
          "${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.branch?.name} - ${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.branch?.code}",
        ),
        buildInformationWidget(
          LocalizationKey.accountsAccountOpeningBranchLabel.loc(),
          "${cardDetailsSnapshot.data?.masterAccount?.number} - ${cardDetailsSnapshot.data?.masterAccount?.suffix}",
        ),
        buildInformationWidget(
          LocalizationKey.debitCardDetailsCurrentBalanceLabel.loc(),
          "${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.availableBalanceNonCredit} ${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.currencyCode}",
        ),
        buildInformationWidget(
          LocalizationKey.debitCardDetailsAvailableBalanceLabel.loc(),
          "${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.availableBalance} ${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.currencyCode}",
        ),
        cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.credits == null ||
                // ignore: prefer_is_empty
                cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.credits.length == 0
            ? const SizedBox.shrink()
            : buildInformationWidget(
                LocalizationKey.debitCardDetailsOverdraftLimitLabel.loc(),
                "${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.credits[0].availableAmount} ${cardDetailsSnapshot.data?.masterAccount?.accountDetails?.balance?.currencyCode}",
              ),
      ],
    );
  }

  Widget buildInformationWidget(String? title, String? subTitle, {bool shouldShowDivider = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NeoText(
          title,
          style: NeoTextStyles.bodyElevenMedium,
          textColor: NeoColors.textSecondary,
        ).paddingOnly(bottom: NeoDimens.px4),
        NeoText(
          subTitle,
          style: NeoTextStyles.bodyFourteenSemibold,
        ).paddingOnly(bottom: NeoDimens.px16),
        shouldShowDivider ? NeoDivider(color: NeoColors.borderMediumLight) : const Row(children: [Expanded(child: SizedBox.shrink())]),
      ],
    ).paddingSymmetric(vertical: NeoDimens.px8, horizontal: NeoDimens.px24);
  }
}
