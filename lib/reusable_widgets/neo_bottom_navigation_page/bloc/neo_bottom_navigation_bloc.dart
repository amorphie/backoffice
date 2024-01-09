import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'neo_bottom_navigation_event.dart';
part 'neo_bottom_navigation_state.dart';

class NeoBottomNavigationBloc extends Bloc<NeoBottomNavigationEvent, NeoBottomNavigationState> {
  NeoBottomNavigationBloc() : super(const NeoBottomNavigationState(0)) {
    on<NeoBottomNavigationEventChangeTab>((event, emit) {
      emit(NeoBottomNavigationState(event.tabIndex));
    });
  }
}
