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

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';

part 'neo_dropdown_bottom_sheet_event.dart';
part 'neo_dropdown_bottom_sheet_state.dart';

class NeoDropdownBottomSheetBloc extends Bloc<NeoDropdownBottomSheetEvent, NeoDropdownBottomSheetState> {
  List<BaseDropdownItemData> itemList;

  BaseDropdownItemData? _selectedItem;

  List<BaseDropdownItemData> itemListFiltered = [];

  NeoDropdownBottomSheetBloc(this.itemList) : super(NeoDropdownBottomSheetStateUnselected()) {
    _selectedItem = itemList.firstWhereOrNull((item) => item.isInitiallySelected);
    itemListFiltered = itemList;

    on<NeoDropdownBottomSheetEventSelectItem>((event, emit) {
      _selectedItem = event.selectedItem;
      itemList.selectItem(event.selectedItem);
      emit(NeoDropdownBottomSheetStateSelected(selectedItem: event.selectedItem, closeBottomSheet: false));
    });

    on<NeoDropdownBottomSheetEventConfirmSelection>((event, emit) {
      if (_selectedItem != null) {
        itemList.selectItem(_selectedItem!);
      }
      emit(
        NeoDropdownBottomSheetStateSelected(selectedItem: _selectedItem, closeBottomSheet: true),
      );
    });

    on<NeoDropdownBottomSheetEventSearchItem>((event, emit) {
      itemListFiltered = event.filteredItems;
      emit(NeoDropdownBottomSheetStateSearchResult(itemListFiltered));
    });
  }
}
