import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/bloc/neo_swipe_card_event.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/bloc/neo_swipe_card_state.dart';

class NeoSwipeCardBloc extends Bloc<NeoCardEvent, NeoSwipeCardState> {
  NeoSwipeCardBloc() : super(NeoSwipeCardState(currentIndex: 0, cards: List.empty())) {
    on<NeoSwipeCardEventInitialize>((event, emit) {
      emit(
        NeoSwipeCardState(
          currentIndex: state.currentIndex,
          cards: event.cards,
          currentCardXPosition: state.currentCardXPosition,
          currentCardRotation: state.currentCardRotation,
        ),
      );
    });

    on<NeoSwipeCardEventSwipeRight>((event, emit) {
      emit(
        NeoSwipeCardState(
          currentIndex: state.currentIndex - 1,
          cards: state.cards,
          currentCardXPosition: state.currentCardXPosition,
          currentCardRotation: state.currentCardRotation,
        ),
      );
    });

    on<NeoSwipeCardEventSwipeLeft>((event, emit) {
      emit(
        NeoSwipeCardState(
          currentIndex: state.currentIndex + 1,
          cards: state.cards,
          currentCardXPosition: state.currentCardXPosition,
          currentCardRotation: state.currentCardRotation,
        ),
      );
    });

    on<NeoSwipeCardEventUpdatePositions>((event, emit) {
      emit(
        NeoSwipeCardState(
          currentIndex: state.currentIndex,
          cards: state.cards,
          currentCardXPosition: event.currentCardXPosition,
          currentCardRotation: event.currentCardRotation,
        ),
      );
    });
  }
}
