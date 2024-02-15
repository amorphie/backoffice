import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/pages/usecases/get_loading_widget_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_type.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/neo_debit_card.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/bloc/neo_debit_card_list_view_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/bloc/neo_debit_card_list_view_event.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/bloc/neo_debit_card_list_view_state.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/network/neo_debit_card_list_view_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_constants.dart';
import 'package:backoffice/util/extensions/neo_extensions.dart';

class NeoDebitCardListView extends StatelessWidget {
  final Widget emptyWidget;
  final Widget? errorWidget;
  final String? bannerUrl;
  final String? navigationPath;
  final EdgeInsetsDirectional padding;

  const NeoDebitCardListView({
    required this.emptyWidget,
    this.errorWidget,
    this.bannerUrl,
    this.navigationPath,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoDebitCardListViewBloc(networkManager: NeoDebitCardListViewNetworkManager())..add(const NeoDebitCardListViewEventFetchItemList()),
      child: BlocBuilder<NeoDebitCardListViewBloc, NeoDebitCardListViewState>(
        builder: (context, state) {
          return StreamBuilder<List<NeoDebitCardItemData>>(
            stream: context.read<NeoDebitCardListViewBloc>().itemListStream,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return GetLoadingWidgetUsecase().call("");
              } else {
                //TODO: Add error design and empty widget
                if (snapshot.data!.isEmpty) {
                  return emptyWidget;
                } else {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: buildCardsList(snapshot.data ?? []),
                        ),
                      ),
                    ],
                  ).padding(padding);
                }
              }
            },
          );
        },
      ),
    );
  }

  List<Widget> buildCardsList(List<NeoDebitCardItemData> itemList) {
    final List<Widget> widgetList = [];

    itemList.groupListsBy((item) => item.cardType).forEach((cardType, cardList) {
      Map.fromEntries(
        cardList.groupListsBy((itemData) => itemData.type).entries.toList()..sort((i1, i2) => (i1.key ?? 0).compareTo(i2.key ?? 0)),
      ).forEach((type, cardList) {
        widgetList.add(
          NeoText(
            NeoDebitCardType.fromCardType(cardType, type!).getListTitle(),
            textAlign: TextAlign.start,
            style: NeoTextStyles.bodyTwelveMedium.apply(color: NeoColors.textSecondary),
          ).paddingOnly(
            top: widgetList.isEmpty ? NeoDimens.px0 : NeoDimens.px40,
            bottom: NeoDimens.px8,
            start: NeoDimens.px24,
          ),
        );
        for (final cardItem in cardList) {
          widgetList.add(
            NeoDebitCard(itemData: cardItem, navigationPath: navigationPath).paddingOnly(start: NeoDimens.px16, top: NeoDimens.px16, end: NeoDimens.px16),
          );
        }
      });
    });
    return widgetList;
  }
}
