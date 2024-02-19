/*
 * neo_bank
 *
 * Created on 9/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

part of 'neo_dropdown_bloc.dart';

sealed class NeoDropdownEvent extends Equatable {
  const NeoDropdownEvent();
}

class NeoDropdownEventInit<T extends BaseDropdownItemData> extends NeoDropdownEvent {
  final List<T> itemList;

  const NeoDropdownEventInit({required this.itemList});

  @override
  List<Object?> get props => [itemList];
}

class NeoDropdownEventSelectItem extends NeoDropdownEvent {
  final BaseDropdownItemData selectedItem;

  const NeoDropdownEventSelectItem(this.selectedItem);

  @override
  List<Object?> get props => [selectedItem];
}
