import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:backoffice/reusable_widgets/neo_switch/bloc/neo_switch_event.dart';
import 'package:backoffice/reusable_widgets/neo_switch/bloc/neo_switch_state.dart';

class NeoSwitchBloc extends Bloc<NeoSwitchEvent, NeoSwitchState> {
  NeoSwitchBloc() : super(const NeoSwitchState()) {
    on<NeoSwitchEventToggleValue>((event, emit) {
      emit(NeoSwitchState(isEnabled: !state.isEnabled));
    });
    on<NeoSwitchEventInitial>((event, emit) {
      emit(NeoSwitchState(isEnabled: event.isEnabled));
    });
  }
}
