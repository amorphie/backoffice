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

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore: must_be_immutable
abstract class BaseDropdownItemData extends Equatable {
  @JsonKey(name: "formData")
  final dynamic formData;

  @JsonKey(name: "isInitiallySelected")
  bool isInitiallySelected;

  BaseDropdownItemData({required this.formData, this.isInitiallySelected = false});
}

extension BaseDropdownItemDataListExtension<T extends BaseDropdownItemData> on List<T> {
  void selectItem(T itemToSelect) {
    for (final item in this) {
      item.isInitiallySelected = (item == itemToSelect);
    }
  }

  void clearSelections() {
    for (final item in this) {
      item.isInitiallySelected = false;
    }
  }
}
