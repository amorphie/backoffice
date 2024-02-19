import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';

part 'neo_bottom_navigation_event.dart';
part 'neo_bottom_navigation_state.dart';

class NeoBottomNavigationBloc extends Bloc<NeoBottomNavigationEvent, NeoBottomNavigationState> {
  NeoBottomNavigationBloc() : super(const NeoBottomNavigationState(0)) {
    _listenWidgetEventKey();
    on<NeoBottomNavigationEventChangeTab>((event, emit) {
      emit(NeoBottomNavigationState(event.tabIndex));
    });
  }

  void _listenWidgetEventKey() {
    NeoWidgetEventKeys.neoBottomNavigationSelectHomeTab.listenEvent(onEventReceived: (_) => add(const NeoBottomNavigationEventChangeTab(0)));
  }
}
