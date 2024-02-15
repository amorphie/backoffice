part of 'neo_expandable_information_card_bloc.dart';

sealed class NeoExpandableInformationCardState extends Equatable {
  const NeoExpandableInformationCardState();
}

class NeoExpandableInformationCardExpandedState extends NeoExpandableInformationCardState {
  const NeoExpandableInformationCardExpandedState();

  @override
  List<Object> get props => [];
}

class NeoExpandableInformationCardCollapsedState extends NeoExpandableInformationCardState {
  const NeoExpandableInformationCardCollapsedState();

  @override
  List<Object> get props => [];
}
