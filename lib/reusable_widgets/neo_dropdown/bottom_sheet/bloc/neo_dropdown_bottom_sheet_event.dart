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

part of 'neo_dropdown_bottom_sheet_bloc.dart';

sealed class NeoDropdownBottomSheetEvent extends Equatable {
  const NeoDropdownBottomSheetEvent();
}

class NeoDropdownBottomSheetEventSelectItem extends NeoDropdownBottomSheetEvent {
  final BaseDropdownItemData selectedItem;

  const NeoDropdownBottomSheetEventSelectItem(this.selectedItem);

  @override
  List<Object?> get props => [selectedItem];
}

class NeoDropdownBottomSheetEventConfirmSelection extends NeoDropdownBottomSheetEvent {
  @override
  List<Object?> get props => [];
}

class NeoDropdownBottomSheetEventSearchItem extends NeoDropdownBottomSheetEvent {
  final List<BaseDropdownItemData> filteredItems;

  const NeoDropdownBottomSheetEventSearchItem(this.filteredItems);

  @override
  List<Object?> get props => [filteredItems];
}
