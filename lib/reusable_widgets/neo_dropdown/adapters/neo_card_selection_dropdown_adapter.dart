/*
 * 
 * neo_bank
 * 
 * Created on 29/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_card_selection/model/neo_card_selection_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_dropdown_base_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_widgets/neo_card_selection_dropdown_item_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoCardSelectionDropdownAdapter extends NeoDropdownBaseAdapter<NeoCardSelectionItemData> {
  final String transitionId;

  NeoCardSelectionDropdownAdapter({required this.transitionId});

  @override
  List<NeoCardSelectionItemData> itemList = [
    NeoCardSelectionItemData(
      formData: "",
      cardImageUrn: NeoAssets.cardCreditStandart.urn,
      cardName: "debitCard_cardBottomsheet_creditCard_label",
    ),
    NeoCardSelectionItemData(
      formData: "",
      cardImageUrn: NeoAssets.cardCreditStandart.urn,
      cardName: "debitCard_cardList_onBankCard_text",
    ),
    NeoCardSelectionItemData(
      formData: "",
      cardImageUrn: NeoAssets.cardCreditStandart.urn,
      cardName: "debitCard_cardList_digitalCard_text",
    ),
  ];

  @override
  String get bottomSheetTitle => "debitCard_cardBottomsheet_title";

  /// TODO: Using <BaseDropdownItemData> is a dart compiler bug. We cant write <NeoAccountSelectionItemData> as generic type
  ///  Try to improve it with newer dart versions
  @override
  NeoDropdownBottomSheetItemBuilder<BaseDropdownItemData> get bottomSheetItemBuilder => (context, itemData) {
        /// Also, this cast should not be necessary. Try to remove in future dart versions.
        itemData as NeoCardSelectionItemData;

        return NeoCardSelectionDropdownItemButton(
          itemData: itemData,
          startWorkflow: true,
          transitionId: transitionId,
        );
      };

  @override
  bool get displaySubmitButton => false;

  @override
  List<NeoCardSelectionItemData>? Function(String key) get filterItems => (key) {
        return itemList;
      };

  @override
  Widget Function(BuildContext, BaseDropdownItemData) get selectedBuilder => (
        BuildContext context,
        BaseDropdownItemData selectedItem,
      ) {
        return _buildContent();
      };

  @override
  Widget Function(BuildContext) get unselectedBuilder => (BuildContext context) {
        return _buildContent();
      };

  @override
  String get submitButtonText => "";

  Widget _buildContent() {
    return NeoIcon(iconUrn: NeoAssets.creditCardAdd24px.urn);
  }
}
