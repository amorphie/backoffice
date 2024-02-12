import 'dart:async';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';
import 'package:neo_core/core/network/managers/neo_network_manager.dart';
import 'package:neo_core/core/workflow_form/neo_workflow_manager.dart';

part 'neo_bo_button_event.dart';
part 'neo_bo_button_state.dart';

class NeoBoButtonBloc extends Bloc<NeoBoButtonEvent, NeoBoButtonState> {
  late NeoWorkflowManager neoWorkflowManager = NeoWorkflowManager(GetIt.I<NeoNetworkManager>());
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  NeoBoButtonBloc() : super(const NeoBoButtonState()) {
    _listenButtonChangeEnableStatus();
    on<NeoBoButtonEventInitial>(_onInitial);
    on<NeoBoButtonEventStartTransition>(_onStartTransition);
    on<NeoBoButtonEventChangeEnableButtonStatus>(_onChangeEnableButtonStatus);
  }

  void _onInitial(NeoBoButtonEventInitial event, Emitter<NeoBoButtonState> emit) {
    emit(NeoBoButtonState(buttonEnabled: event.enabled));
  }

  Future _onStartTransition(NeoBoButtonEventStartTransition event, Emitter<NeoBoButtonState> emit) async {
    if (event.startWorkflow) {
      final response = await neoWorkflowManager.initWorkflow(workflowName: event.transitionId);
      if (response["view-source"] == "transition") {
        var transition = (response["transition"] as List).firstWhereOrNull((element) => element["type"] == "Forward");
        if (transition != null) {
          emit(
            NeoBoButtonState(
              navigationData: SignalrTransitionData(
                navigationPath: transition["transition"],
                // STOPSHIP: Get from API
                navigationType: NeoNavigationType.push,
                pageId: response["state"],
                viewSource: response["view-source"],
                initialData: {},
                isBackNavigation: false,
              ),
            ),
          );
        }
      } else {
        emit(
          NeoBoButtonState(
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
      }
      emit(const NeoBoButtonState()); // Clear the navigation path to prevent back button bugs from navigated page
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
          add(NeoBoButtonEventChangeEnableButtonStatus(status: status));
        }
      ),
      (
        NeoWidgetEventKeys.neoButtonStartTransition,
        (event) {
          add(
            NeoBoButtonEventStartTransition(
              startWorkflow: false,
              transitionId: event.data! as String,
              transitionBody: const {},
            ),
          );
        }
      ),
    ].listenEvents();
  }

  void _onChangeEnableButtonStatus(NeoBoButtonEventChangeEnableButtonStatus event, Emitter<NeoBoButtonState> emit) {
    emit(NeoBoButtonState(buttonEnabled: event.status));
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
