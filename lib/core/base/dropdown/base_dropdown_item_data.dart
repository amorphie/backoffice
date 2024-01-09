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

import 'package:json_annotation/json_annotation.dart';

abstract class BaseDropdownItemData {
  @JsonKey(name: "formData")
  final String formData;

  @JsonKey(name: "displayData")
  final String displayData;

  @JsonKey(name: "isInitiallySelected")
  bool isInitiallySelected;

  BaseDropdownItemData({required this.formData, required this.displayData, this.isInitiallySelected = false});
}

extension BaseDropdownItemDataListExtension on List<BaseDropdownItemData> {
  void selectItem(BaseDropdownItemData itemToSelect) {
    for (final item in this) {
      item.isInitiallySelected = (item == itemToSelect);
    }
  }
}
