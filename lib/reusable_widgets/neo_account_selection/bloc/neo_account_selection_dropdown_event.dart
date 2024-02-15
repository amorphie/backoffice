part of 'neo_account_selection_dropdown_bloc.dart';

sealed class NeoAccountSelectionDropdownEvent extends Equatable {
  const NeoAccountSelectionDropdownEvent();
}

class NeoAccountSelectionDropdownEventFetchAccountList extends NeoAccountSelectionDropdownEvent {
  @override
  List<Object?> get props => [];
}
