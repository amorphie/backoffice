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
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_dropdown_base_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_widgets/neo_list_tile_item_widget.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoSecurityQuestionSelectionDropdownAdapter extends NeoDropdownBaseAdapter<NeoDropdownListTileData> {
  final List<NeoDropdownListTileData> items;
  final Function(String formData) onItemSelected;

  NeoSecurityQuestionSelectionDropdownAdapter({required this.items, required this.onItemSelected});

  @override
  List<NeoDropdownListTileData> get itemList => items;

  @override
  String get bottomSheetTitle => LocalizationKey.loginSecurityQuestionQuestionTitle.loc();

  @override
  String? get searchHintText => null;

  @override
  String get submitButtonText => "";

  @override
  bool get displaySubmitButton => false;

  @override
  Widget Function(BuildContext) get unselectedBuilder => (BuildContext context) => _buildComponent(null);

  @override
  Widget Function(BuildContext, NeoDropdownListTileData) get selectedBuilder => (
        BuildContext context,
        NeoDropdownListTileData selectedItem,
      ) {
        return _buildComponent(selectedItem);
      };

  @override
  NeoDropdownBottomSheetItemBuilder<BaseDropdownItemData> get bottomSheetItemBuilder => (context, item) {
        return Listener(
          onPointerDown: (_) => onItemSelected(item.formData ?? ""),
          child: NeoListTileItemWidget(item: item as NeoDropdownListTileData),
        );
      };

  Widget _buildComponent(NeoDropdownListTileData? currentItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        NeoText(LocalizationKey.loginSecurityQuestionQuestionTitle.loc(), style: NeoTextStyles.bodyTwelveMedium).paddingOnly(bottom: NeoDimens.px4, end: NeoDimens.px4),
        AbsorbPointer(
          child: DropdownButtonFormField<NeoDropdownListTileData>(
            value: currentItem,
            items: itemList.map((e) => DropdownMenuItem<NeoDropdownListTileData>(value: e, child: NeoText(e.displayData))).toList(),
            onChanged: (BaseDropdownItemData? value) {},
            style: NeoTextStyles.labelFourteenMedium,
            validator: (_) => currentItem.isNull ? LocalizationKey.loginSecurityQuestionSelectionErrorMessage.loc() : null,
            autovalidateMode: currentItem.isNull ? AutovalidateMode.onUserInteraction : AutovalidateMode.always,
            hint: NeoText(
              LocalizationKey.loginSecurityQuestionQuestionPlaceholder.loc(),
              style: NeoTextStyles.labelFourteenMedium.copyWith(color: NeoColors.textPlaceholder),
            ),
            icon: NeoIcon(
              iconUrn: NeoAssets.arrowDown16px.urn,
              color: NeoColors.textDefault,
            ).paddingOnly(start: NeoDimens.px8),
            borderRadius: BorderRadius.circular(NeoRadius.px8),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: NeoDimens.px16, vertical: NeoDimens.px2),
              errorMaxLines: 2,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(NeoRadius.px8),
                borderSide: BorderSide(color: NeoColors.borderMediumDark),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(NeoRadius.px8),
                borderSide: BorderSide(color: NeoColors.borderMediumDark),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ),
      ],
    );
  }

  @override
  List<NeoDropdownListTileData>? Function(String key) get filterItems => (key) {
        return itemList;
      };
}
