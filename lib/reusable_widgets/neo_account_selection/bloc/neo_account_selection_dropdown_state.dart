part of 'neo_account_selection_dropdown_bloc.dart';

sealed class NeoAccountSelectionDropdownState extends Equatable {
  const NeoAccountSelectionDropdownState();
}

class NeoAccountSelectionDropdownStateLoading extends NeoAccountSelectionDropdownState {
  @override
  List<Object> get props => [];
}

class NeoAccountSelectionDropdownStateLoaded extends NeoAccountSelectionDropdownState {
  final List<NeoAccountSelectionItemData> accountList;

  const NeoAccountSelectionDropdownStateLoaded({required this.accountList});

  @override
  List<Object> get props => [accountList];
}

class NeoAccountSelectionDropdownStateError extends NeoAccountSelectionDropdownState {
  final String error;

  const NeoAccountSelectionDropdownStateError(this.error);

  @override
  List<Object> get props => [error];
}
