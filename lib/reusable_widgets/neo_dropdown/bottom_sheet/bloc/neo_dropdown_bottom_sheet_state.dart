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

abstract class NeoDropdownBottomSheetState extends Equatable {
  const NeoDropdownBottomSheetState();
}

class NeoDropdownBottomSheetStateUnselected extends NeoDropdownBottomSheetState {
  @override
  List<Object> get props => [];
}

class NeoDropdownBottomSheetStateSelected extends NeoDropdownBottomSheetState {
  final BaseDropdownItemData? selectedItem;
  final bool closeBottomSheet;

  const NeoDropdownBottomSheetStateSelected({
    required this.selectedItem,
    required this.closeBottomSheet,
  });

  @override
  List<Object?> get props => [selectedItem, closeBottomSheet];
}

class NeoDropdownBottomSheetStateSearchResult extends NeoDropdownBottomSheetState {
  final List<BaseDropdownItemData> itemList;

  const NeoDropdownBottomSheetStateSearchResult(this.itemList);

  @override
  List<Object?> get props => [itemList];
}
