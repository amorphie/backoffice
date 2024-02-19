part of 'neo_expandable_information_card_bloc.dart';

sealed class NeoExpandableInformationCardEvent extends Equatable {
  const NeoExpandableInformationCardEvent();
}

class NeoExpandableInformationCardEventToggleCard extends NeoExpandableInformationCardEvent {
  const NeoExpandableInformationCardEventToggleCard();

  @override
  List<Object?> get props => [];
}
