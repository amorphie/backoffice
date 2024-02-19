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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_dropdown_base_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/bloc/neo_dropdown_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/bottom_sheet/usecases/display_neo_dropdown_bottom_sheet_usecase.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/base_dropdown_item_data.dart';

class NeoDropdown<T extends BaseDropdownItemData> extends StatelessWidget {
  const NeoDropdown({required this.adapter, Key? key}) : super(key: key);

  final NeoDropdownBaseAdapter<T> adapter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoDropdownBloc()..add(NeoDropdownEventInit(itemList: adapter.itemList)),
      child: BlocBuilder<NeoDropdownBloc, NeoDropdownState>(
        builder: (context, state) {
          return Listener(
            onPointerDown: (_) {
              if (adapter.itemList.length > 1) {
                _displayDropdownBottomSheet(context);
              }
            },
            child: _buildStates(context, state),
          );
        },
      ),
    );
  }

  Widget _buildStates(BuildContext context, NeoDropdownState state) {
    switch (state) {
      case NeoDropdownStateSelected _:
        return adapter.selectedBuilder(context, state.selectedItem as T);
      case NeoDropdownStateUnselected _:
        return adapter.unselectedBuilder(context);
    }
  }

  void _displayDropdownBottomSheet(BuildContext context) {
    DisplayNeoDropdownBottomSheetUseCase<T>().call(context: context, adapter: adapter).then((selectedItem) {
      if (selectedItem != null) {
        context.read<NeoDropdownBloc>().add(NeoDropdownEventSelectItem(selectedItem));
      } else {
        final selectedItem = context.read<NeoDropdownBloc>().selectedItem;
        if (selectedItem != null) {
          adapter.itemList.selectItem(selectedItem as T);
        } else {
          adapter.itemList.clearSelections();
        }
      }
    });
  }
}
