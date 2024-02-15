import 'package:flutter/material.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/model/neo_hypertext_highlighted_item.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/neo_hypertext.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/item_widgets/neo_swipe_card_item_widget.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/neo_swipe_card.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoSwipeCard => WidgetbookComponent(
      name: 'NeoSwipeCard',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => Scaffold(
            body: NeoSwipeCard(
              cards: [
                NeoSwipeCardItemWidget(
                  card: Column(
                    children: [
                      const SizedBox(height: 180, width: 265, child: Placeholder()),
                      Row(
                        children: [
                          NeoText(
                            LocalizationKey.debitCardListApplyDebitCardTitle.loc(),
                            textAlign: TextAlign.left,
                            style: NeoTextStyles.titleSixteenBold,
                          ).paddingOnly(top: 24),
                        ],
                      ),
                      NeoHypertext(
                        text: LocalizationKey.debitCardListApplyDebitCardText.loc(),
                        style: NeoTextStyles.bodyFourteenMedium,
                        textAlign: TextAlign.left,
                        highlightedItems: [
                          NeoHypertextHighlightedItem(itemKey: '0', text: 'ON Black', data: ''),
                        ],
                      ).paddingOnly(top: 12),
                      Row(
                        children: [
                          NeoIcon(iconUrn: NeoAssets.cameraPhoto24px.urn),
                          Expanded(
                            child: NeoText(
                              //STOPSHIP: Apply localization
                              'Kart aidatı yok.',
                              style: NeoTextStyles.bodyTwelveMedium,
                            ).paddingOnly(start: 12),
                          ),
                        ],
                      ).paddingOnly(top: 12),
                      Row(
                        children: [
                          NeoIcon(iconUrn: NeoAssets.eye20px.urn),
                          Expanded(
                            child: NeoText(
                              //STOPSHIP: Apply localization
                              'Temassız özellik ile yurtiçi ve yurtdışı POS ve ATM’lerde işlem yapabilirsin.',
                              style: NeoTextStyles.bodyTwelveMedium,
                            ).paddingOnly(start: 12),
                          ),
                        ],
                      ).paddingOnly(top: 12),
                    ],
                  ).paddingSymmetric(vertical: 32, horizontal: 32),
                ),
              ],
            ),
          ),
        ),
      ],
    );
