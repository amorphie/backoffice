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

sealed class NeoAddressSelectionDropdownEvent extends Equatable {
  const NeoAddressSelectionDropdownEvent();
}

class NeoAddressSelectionDropdownEventFetchAddressList extends NeoAddressSelectionDropdownEvent {
  @override
  List<Object?> get props => [];
}
