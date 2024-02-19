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

sealed class NeoDropdownState extends Equatable {
  const NeoDropdownState();
}

class NeoDropdownStateUnselected extends NeoDropdownState {
  @override
  List<Object> get props => [];
}

class NeoDropdownStateSelected extends NeoDropdownState {
  final BaseDropdownItemData selectedItem;
  final bool closeDropdown;

  const NeoDropdownStateSelected({required this.selectedItem, this.closeDropdown = false});

  @override
  List<Object> get props => [selectedItem, closeDropdown];
}
