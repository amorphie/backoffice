/*
 * 
 * neo_bank
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/models/neo_account_selection_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_sub_type.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/neo_account_widget.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_dropdown_base_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/bottom_sheet/bloc/neo_dropdown_bottom_sheet_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoAccountSelectionDropdownAdapter extends NeoDropdownBaseAdapter<NeoAccountSelectionItemData> {
  final List<NeoAccountSelectionItemData> items;
  final Function(List<Map<String, dynamic>> formData) onItemSelected;

  NeoAccountSelectionDropdownAdapter({required this.items, required this.onItemSelected});

  @override
  List<NeoAccountSelectionItemData> get itemList => items;

  @override
  String get bottomSheetTitle => LocalizationKey.debitCardApplicationMainAccountLabel.loc();

  // STOPSHIP: Apply localization
  @override
  String? get searchHintText => "Hesap Ara...";

  @override
  Widget Function(BuildContext) get unselectedBuilder => (BuildContext context) {
        return _buildComponent(
          itemList.length == 1 ? itemList.first : null,
        );
      };

  @override
  Widget Function(BuildContext, NeoAccountSelectionItemData) get selectedBuilder => (
        BuildContext context,
        NeoAccountSelectionItemData selectedItem,
      ) {
        return _buildComponent(selectedItem);
      };

  @override
  String get submitButtonText => LocalizationKey.generalContinueWithSelectionButton.loc();

  /// TODO: Using <BaseDropdownItemData> is a dart compiler bug. We cant write <NeoAccountSelectionItemData> as generic type
  ///  Try to improve it with newer dart versions
  @override
  NeoDropdownBottomSheetItemBuilder<BaseDropdownItemData> get bottomSheetItemBuilder => (context, itemData) {
        /// Also, this cast should not be necessary. Try to remove in future dart versions.
        itemData as NeoAccountSelectionItemData;

        return GestureDetector(
          onTap: () {
            context.read<NeoDropdownBottomSheetBloc>().add(NeoDropdownBottomSheetEventSelectItem(itemData));
            onItemSelected(itemData.formData);
          },
          child: _buildAccountCard(itemData),
        );
      };

  Widget _buildAccountCard(NeoAccountSelectionItemData itemData) {
    return NeoAccountWidget(
      name: itemData.name,
      type: itemData.accountSubtype.getSubTypeName(),
      amount: itemData.balance.availableBalance.orZero,
      number: itemData.number,
      suffix: itemData.suffix,
      currency: itemData.currency,
      isSelected: itemData.isInitiallySelected,
    );
  }

  Widget _buildComponent(NeoAccountSelectionItemData? currentItem) {
    return currentItem.isNull ? _buildUnselectedState() : _buildSelectedState(currentItem!);
  }

  Widget _buildUnselectedState() {
    return AbsorbPointer(
      child: DropdownButtonFormField<NeoAccountSelectionItemData>(
        items: null,
        onChanged: null,
        style: NeoTextStyles.labelFourteenMedium,
        hint: NeoText(
          LocalizationKey.generalSelectPlaceholder.loc(),
          style: NeoTextStyles.labelFourteenMedium.copyWith(color: NeoColors.textPlaceholder),
        ),
        icon: NeoIcon(
          iconUrn: NeoAssets.arrowDown16px.urn,
          color: NeoColors.textPlaceholder,
        ),
        borderRadius: BorderRadius.circular(NeoRadius.px8),
        decoration: InputDecoration(
          filled: true,
          fillColor: NeoColors.baseWhite,
          contentPadding: const EdgeInsets.symmetric(horizontal: NeoDimens.px16, vertical: NeoDimens.px12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NeoRadius.px8),
            borderSide: BorderSide(color: NeoColors.borderMediumDark),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedState(NeoAccountSelectionItemData currentItem) {
    return NeoAccountWidget(
      name: currentItem.name,
      type: currentItem.accountSubtype.getSubTypeName(),
      amount: currentItem.balance.availableBalance.orZero,
      number: currentItem.number,
      suffix: currentItem.suffix,
      currency: currentItem.currency,
      iconUrn: NeoAssets.arrowDown16px.urn,
    );
  }

  @override
  List<NeoAccountSelectionItemData>? Function(String key) get filterItems => (key) {
        final searchText = key.toLowerCase();

        final List<NeoAccountSelectionItemData> itemListFiltered = itemList.where((item) {
          final accountName = item.name.orEmpty.toLowerCase();
          final accountNumber = item.number.orEmpty.toLowerCase();
          return accountName.contains(searchText) || accountNumber.contains(searchText);
        }).toList();

        return itemListFiltered;
      };
}
