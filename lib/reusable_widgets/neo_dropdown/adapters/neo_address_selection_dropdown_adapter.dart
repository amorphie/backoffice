/*
 * neo_bank
 *
 * Created on 10/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_address_selection/models/neo_address_selection_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_dropdown_base_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/bottom_sheet/bloc/neo_dropdown_bottom_sheet_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const homeType = "home";
  static const businessType = "business";
}

class NeoAddressSelectionDropdownAdapter extends NeoDropdownBaseAdapter<NeoAddressSelectionItemData> {
  final List<NeoAddressSelectionItemData> items;
  final Function(Map<String, dynamic> formData) onItemSelected;

  NeoAddressSelectionDropdownAdapter({required this.items, required this.onItemSelected});

  @override
  List<NeoAddressSelectionItemData> get itemList => items;

  @override
  String get bottomSheetTitle => LocalizationKey.debitCardApplicationDeliveryAddressLabel.loc();

  @override
  String? get searchHintText => null;

  @override
  Widget Function(BuildContext) get unselectedBuilder => (BuildContext context) => _buildComponent(
        itemList.length == 1 ? itemList.first : null,
      );

  @override
  Widget Function(BuildContext, NeoAddressSelectionItemData) get selectedBuilder => (
        BuildContext context,
        NeoAddressSelectionItemData selectedItem,
      ) {
        return _buildComponent(selectedItem);
      };

  @override
  String get submitButtonText => LocalizationKey.generalContinueWithSelectionButton.loc();

  /// TODO: Using <BaseDropdownItemData> is a dart compiler bug. We cant write <NeoAddressSelectionItemData> as generic type
  ///  Try to improve it with newer dart versions
  @override
  NeoDropdownBottomSheetItemBuilder<BaseDropdownItemData> get bottomSheetItemBuilder => (context, itemData) {
        /// Also, this cast should not be necessary. Try to remove in future dart versions.
        itemData as NeoAddressSelectionItemData;

        return GestureDetector(
          onTap: () {
            context.read<NeoDropdownBottomSheetBloc>().add(NeoDropdownBottomSheetEventSelectItem(itemData));
            onItemSelected(itemData.formData);
          },
          child: _buildAdressCard(itemData),
        );
      };

  Widget _buildAdressCard(NeoAddressSelectionItemData itemData) {
    return DecoratedBox(
      decoration: _buildAddressCardDecoration(itemData, true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: NeoDimens.px44,
                height: NeoDimens.px44,
                decoration: _buildIconBoxDecoration(),
                child: NeoIcon(iconUrn: itemData.addressIconUrn.orEmpty).paddingAll(NeoDimens.px12),
              ).paddingOnly(end: NeoDimens.px12),
              NeoText(
                _addressTypeText(itemData.type),
                style: NeoTextStyles.labelFourteenSemibold,
              ),
            ],
          ).paddingOnly(bottom: NeoDimens.px8),
          NeoText(
            itemData.fullAddressInfo.orEmpty,
            style: NeoTextStyles.bodyTwelveMedium.apply(color: NeoColors.textSecondary),
          ),
        ],
      ).paddingAll(NeoDimens.px24),
    );
  }

  BoxDecoration _buildAddressCardDecoration(NeoAddressSelectionItemData itemData, bool shouldShowSelectedBorder) {
    return BoxDecoration(
      color: NeoColors.baseWhite,
      borderRadius: BorderRadius.circular(NeoRadius.px20),
      border: itemData.isInitiallySelected ? Border.all(color: NeoColors.borderPrimaryGreenDark) : null,
    );
  }

  BoxDecoration _buildIconBoxDecoration() => BoxDecoration(color: NeoColors.bgMedium, shape: BoxShape.circle);

  Widget _buildComponent(NeoAddressSelectionItemData? currentItem) {
    return AbsorbPointer(
      child: DropdownButtonFormField<NeoAddressSelectionItemData>(
        value: currentItem,
        isExpanded: true,
        items: itemList
            .map(
              (item) => DropdownMenuItem<NeoAddressSelectionItemData>(
                value: item,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: NeoText(
                        "${_addressTypeText(item.type)} (${item.fullAddressInfo.orEmpty})",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (BaseDropdownItemData? value) {},
        style: NeoTextStyles.labelFourteenMedium,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hint: NeoText(
          LocalizationKey.generalSelectPlaceholder.loc(),
          style: NeoTextStyles.labelFourteenMedium.copyWith(color: NeoColors.textPlaceholder),
        ),
        icon: NeoIcon(
          iconUrn: NeoAssets.arrowDown16px.urn,
          color: NeoColors.textDefault,
        ).paddingOnly(start: NeoDimens.px8),
        borderRadius: BorderRadius.circular(NeoRadius.px8),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(NeoDimens.px16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NeoRadius.px8),
            borderSide: BorderSide(color: NeoColors.borderMediumDark),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  String _addressTypeText(String? type) {
    switch (type) {
      case _Constants.homeType:
        return LocalizationKey.profileAndSettingsHomeAddressTitle.loc();
      case _Constants.businessType:
        return LocalizationKey.profileAndSettingsBusinessAddressTitle.loc();
      default:
        return "";
    }
  }

  @override
  List<NeoAddressSelectionItemData>? Function(String key) get filterItems => (key) {
        return itemList;
      };
}
