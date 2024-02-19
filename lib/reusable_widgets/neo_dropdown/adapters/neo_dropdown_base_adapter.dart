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
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';

typedef NeoDropdownBottomSheetItemBuilder<T extends BaseDropdownItemData> = Widget Function(
  BuildContext context,
  T item,
);

abstract class NeoDropdownBaseAdapter<T extends BaseDropdownItemData> {
  abstract final List<T> itemList;
  abstract final String bottomSheetTitle;

  abstract final Widget Function(BuildContext, T) selectedBuilder;
  abstract final Widget Function(BuildContext) unselectedBuilder;

  abstract final List<T>? Function(String key) filterItems;

  abstract final NeoDropdownBottomSheetItemBuilder<T> bottomSheetItemBuilder;

  abstract final String submitButtonText;
  final bool displaySubmitButton = true;
  final String? searchHintText = null;
}
