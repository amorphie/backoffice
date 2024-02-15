/*
 * neo_bank
 *
 * Created on 11/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoListTileItemWidget extends StatelessWidget {
  final NeoDropdownListTileData item;

  const NeoListTileItemWidget({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.leadingIconUrn != null ? NeoIcon(iconUrn: item.leadingIconUrn.orEmpty) : null,
      title: NeoText(item.displayData, style: NeoTextStyles.bodySixteenMedium),
      onTap: () {
        final selectedItem = item..isInitiallySelected = true;
        Navigator.pop<BaseDropdownItemData?>(context, selectedItem);
        item.onPressed?.call();
      },
      trailing: item.isInitiallySelected ? NeoIcon(iconUrn: NeoAssets.check24px.urn, color: NeoColors.iconSuccess) : null,
    );
  }
}
