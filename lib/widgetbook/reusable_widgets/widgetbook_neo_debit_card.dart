import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/model/neo_debit_card_item_data_master_account.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/neo_debit_card.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoDebitCard => WidgetbookComponent(
      name: 'NeoDebitCard',
      useCases: [
        WidgetbookUseCase(
          name: 'Card List',
          builder: (context) => const SingleChildScrollView(
            child: Column(
              children: [
                NeoDebitCard(
                  itemData: NeoDebitCardItemData(
                    cardNumber: "535806dxozzn8345",
                    issuedToName: "GÜLAY BAŞ",
                    cardType: 2,
                    logoCode: "002",
                    type: 10,
                    statusCode: "GB",
                    statusName: "TEST",
                    masterAccount: NeoDebitCardItemDataMasterAccount(
                      iban: "TR150012509332009692200391",
                      number: 20096922,
                      branch: 9330,
                      suffix: 391,
                      balance: 123212.0,
                      currency: "TRY",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
