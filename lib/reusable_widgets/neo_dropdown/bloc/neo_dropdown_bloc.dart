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

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';

part 'neo_dropdown_event.dart';
part 'neo_dropdown_state.dart';

class NeoDropdownBloc extends Bloc<NeoDropdownEvent, NeoDropdownState> {
  late List<BaseDropdownItemData> itemList;
  BaseDropdownItemData? selectedItem;

  NeoDropdownBloc() : super(NeoDropdownStateUnselected()) {
    on<NeoDropdownEventInit>((event, emit) {
      itemList = event.itemList;
    });

    on<NeoDropdownEventSelectItem>((event, emit) {
      selectedItem = event.selectedItem;
      itemList.selectItem(event.selectedItem);
      emit(NeoDropdownStateSelected(selectedItem: event.selectedItem));
    });
  }
}
