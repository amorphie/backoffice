import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'neo_expandable_information_card_event.dart';
part 'neo_expandable_information_card_state.dart';

class NeoExpandableInformationCardBloc
    extends Bloc<NeoExpandableInformationCardEvent, NeoExpandableInformationCardState> {
  NeoExpandableInformationCardBloc() : super(const NeoExpandableInformationCardCollapsedState()) {
    on<NeoExpandableInformationCardEventToggleCard>(_onToggleCard);
  }

  _onToggleCard(
    NeoExpandableInformationCardEventToggleCard event,
    Emitter<NeoExpandableInformationCardState> emit,
  ) {
    state is NeoExpandableInformationCardCollapsedState
        ? emit(const NeoExpandableInformationCardExpandedState())
        : emit(const NeoExpandableInformationCardCollapsedState());
  }
}
