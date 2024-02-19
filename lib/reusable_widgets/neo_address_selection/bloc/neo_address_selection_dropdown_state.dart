/*
 * 
 * neo_bank
 * 
 * Created on 19/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

part of 'neo_address_selection_dropdown_bloc.dart';

sealed class NeoAddressSelectionDropdownState extends Equatable {
  const NeoAddressSelectionDropdownState();
}

class NeoAddressSelectionDropdownStateLoading extends NeoAddressSelectionDropdownState {
  @override
  List<Object> get props => [];
}

class NeoAddressSelectionDropdownStateLoaded extends NeoAddressSelectionDropdownState {
  final List<NeoAddressSelectionItemData> addressList;

  const NeoAddressSelectionDropdownStateLoaded({required this.addressList});

  @override
  List<Object> get props => [addressList];
}

class NeoAddressSelectionDropdownStateError extends NeoAddressSelectionDropdownState {
  final String error;

  const NeoAddressSelectionDropdownStateError(this.error);

  @override
  List<Object> get props => [error];
}
