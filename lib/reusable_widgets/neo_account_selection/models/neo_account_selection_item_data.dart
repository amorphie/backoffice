/*
 * 
 * Neobank.Client
 * 
 * Created on 11/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:backoffice/reusable_widgets/neo_account_selection/models/neo_account_selection_response_data.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_balance.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_sub_type.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/util/neo_util.dart';

// ignore: must_be_immutable
class NeoAccountSelectionItemData extends BaseDropdownItemData {
  NeoAccountSelectionItemData({
    required super.formData,
    required this.name,
    required this.accountSubtype,
    required this.number,
    required this.suffix,
    required this.balance,
    required this.currency,
    super.isInitiallySelected = false,
  });

  final String name;
  final NeoAccountSubType accountSubtype;
  final NeoAccountBalance balance;
  final String number;
  final String suffix;
  final String currency;

  // STOPSHIP: Check formData
  factory NeoAccountSelectionItemData.fromNetworkData(NeoAccountSelectionResponseData response) => NeoAccountSelectionItemData(
        formData: [response.toJson()],
        name: response.name.orEmpty,
        accountSubtype: response.accountSubType!,
        number: response.number.orEmpty,
        suffix: response.suffix.orEmpty,
        balance: response.balance!,
        currency: response.balance!.currencyCode.orEmpty,
      );

  @override
  List<Object?> get props => [
        formData,
        name,
        accountSubtype,
        number,
        suffix,
        balance,
        currency,
      ];
}
