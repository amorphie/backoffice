import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_enable_state.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';
import 'package:neo_core/core/network/managers/neo_network_manager.dart';
import 'package:neo_core/core/workflow_form/neo_workflow_manager.dart';

part 'neo_button_event.dart';
part 'neo_button_state.dart';

class NeoButtonBloc extends Bloc<NeoButtonEvent, NeoButtonState> {
  late NeoWorkflowManager neoWorkflowManager = NeoWorkflowManager(GetIt.I<NeoNetworkManager>());
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  NeoButtonBloc() : super(const NeoButtonState()) {
    _listenButtonChangeEnableStatus();
    on<NeoButtonEventInitial>(_onInitial);
    on<NeoButtonEventInitWorkflow>(_onInitWorkflow);
    on<NeoButtonEventChangeEnableState>(_onChangeEnableState);
  }

  void _onInitial(NeoButtonEventInitial event, Emitter<NeoButtonState> emit) {
    emit(NeoButtonState(enableState: event.enableState));
  }

  Future _onInitWorkflow(NeoButtonEventInitWorkflow event, Emitter<NeoButtonState> emit) async {
    final response = event.initResponse;
    emit(
      state.copyWith(
        navigationData: SignalrTransitionData(
          navigationPath: response["init-page-name"],
          // STOPSHIP: Get from API
          navigationType: NeoNavigationType.push,
          pageId: response["state"],
          viewSource: response["view-source"],
          initialData: {},
          isBackNavigation: false,
        ),
      ),
    );
    // Clear the navigation path to prevent back button bugs from navigated page
    emit(state.clearNavigationData());
  }

  void _listenButtonChangeEnableStatus() {
    _neoWidgetEventSubscription = [
      (
        NeoWidgetEventKeys.neoButtonChangeEnableStateEventKey,
        (event) {
          final enableState = event.data! as NeoButtonEnableState;
          add(NeoButtonEventChangeEnableState(enableState: enableState));
        }
      ),
    ].listenEvents();
  }

  void _onChangeEnableState(NeoButtonEventChangeEnableState event, Emitter<NeoButtonState> emit) {
    emit(NeoButtonState(enableState: event.enableState));
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
