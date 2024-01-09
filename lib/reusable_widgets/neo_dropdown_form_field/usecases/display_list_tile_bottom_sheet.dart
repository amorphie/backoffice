/*
 * neo_bank
 *
 * Created on 25/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/base/dropdown/base_bottom_sheet_usecase.dart';
import 'package:backoffice/core/base/dropdown/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class DisplayListTileBottomSheet<T extends NeoDropdownListTileData> extends BaseBottomSheetUseCase {
  const DisplayListTileBottomSheet();

  @override
  Future<BaseDropdownItemData?> call(BuildContext context, String? title, List<BaseDropdownItemData> itemList) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDragIndicator(),
            _buildTitle(title),
            ..._buildItemList(itemList.cast<T>(), context),
            const SizedBox(height: NeoDimens.px16),
          ],
        ).paddingAll(NeoDimens.px8);
      },
    );
  }

  Widget _buildDragIndicator() {
    return Container(
      width: NeoDimens.px44,
      height: NeoDimens.px4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(NeoRadius.px4), color: NeoColors.borderDark),
    ).paddingOnly(top: NeoDimens.px12);
  }

  Widget _buildTitle(String? title) {
    return title != null ? NeoText(title, style: NeoTextStyles.titleSixteenSemibold).paddingSymmetric(vertical: NeoDimens.px16) : const SizedBox.shrink();
  }

  List<ListTile> _buildItemList(List<T> itemList, BuildContext context) {
    return itemList.map((NeoDropdownListTileData item) {
      return ListTile(
        leading: item.leadingIconUrn != null ? NeoIcon(iconUrn: item.leadingIconUrn.orEmpty) : null,
        title: Text(item.displayData, style: NeoTextStyles.bodySixteenMedium),
        onTap: () {
          final selectedItem = item..isInitiallySelected = true;
          Navigator.pop<BaseDropdownItemData?>(context, selectedItem);
          item.onPressed?.call();
        },
        trailing: item.isInitiallySelected ? NeoIcon(iconUrn: NeoAssets.checkmark.urn) : null,
      );
    }).toList();
  }
}
