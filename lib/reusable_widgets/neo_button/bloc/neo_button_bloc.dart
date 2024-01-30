import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
    on<NeoButtonEventStartTransition>(_onStartTransition);
    on<NeoButtonEventChangeEnableButtonStatus>(_onChangeEnableButtonStatus);
  }

  void _onInitial(NeoButtonEventInitial event, Emitter<NeoButtonState> emit) {
    emit(NeoButtonState(buttonEnabled: event.enabled));
  }

  Future _onStartTransition(NeoButtonEventStartTransition event, Emitter<NeoButtonState> emit) async {
    if (event.startWorkflow) {
      final response = await neoWorkflowManager.initWorkflow(workflowName: event.transitionId);
      emit(
        NeoButtonState(
          navigationData: SignalrTransitionData(
            navigationPath: response["state"],
            // STOPSHIP: Get from API
            navigationType: NeoNavigationType.push,
            pageId: response["state"],
            viewSource: response["view-source"],
            initialData: {},
            isBackNavigation: false,
          ),
        ),
      );
      emit(const NeoButtonState()); // Clear the navigation path to prevent back button bugs from navigated page
    } else {
      await neoWorkflowManager.postTransition(transitionName: event.transitionId, body: event.transitionBody);
    }
  }

  void _listenButtonChangeEnableStatus() {
    _neoWidgetEventSubscription = [
      (
        NeoWidgetEventKeys.neoButtonChangeEnableStatusEventKey,
        (event) {
          final status = event.data! as bool;
          add(NeoButtonEventChangeEnableButtonStatus(status: status));
        }
      ),
      (
        NeoWidgetEventKeys.neoButtonStartTransition,
        (event) {
          add(
            NeoButtonEventStartTransition(
              startWorkflow: false,
              transitionId: event.data! as String,
              transitionBody: const {},
            ),
          );
        }
      ),
    ].listenEvents();
  }

  void _onChangeEnableButtonStatus(NeoButtonEventChangeEnableButtonStatus event, Emitter<NeoButtonState> emit) {
    emit(NeoButtonState(buttonEnabled: event.status));
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
