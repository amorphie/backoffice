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

import '../model/neo_bo_button_enable_state.dart';

part 'neo_bo_button_event.dart';
part 'neo_bo_button_state.dart';

class NeoBoButtonBloc extends Bloc<NeoBoButtonEvent, NeoBoButtonState> {
  late NeoWorkflowManager neoWorkflowManager = NeoWorkflowManager(GetIt.I<NeoNetworkManager>());
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  NeoBoButtonBloc() : super(const NeoBoButtonState()) {
    _listenButtonChangeEnableStatus();
    on<NeoBoButtonEventInitial>(_onInitial);
    on<NeoBoButtonEventInitWorkflow>(_onInitWorkflow);
    on<NeoBoButtonEventChangeEnableState>(_onChangeEnableState);
  }

  void _onInitial(NeoBoButtonEventInitial event, Emitter<NeoBoButtonState> emit) {
    emit(NeoBoButtonState(enableState: event.enableState));
  }

  Future _onInitWorkflow(NeoBoButtonEventInitWorkflow event, Emitter<NeoBoButtonState> emit) async {
    final response = event.initResponse;
    if (response["view-source"] == "transition") {
      var transition = (response["transition"] as List).firstWhereOrNull((element) => element["type"] == "Forward");
      if (transition != null) {
        emit(
          state.copyWith(
            navigationData: SignalrTransitionData(
              navigationPath: transition["transition"],
              // STOPSHIP: Get from API
              navigationType: NeoNavigationType.push,
              pageId: response["state"],
              viewSource: response["view-source"],
              initialData: {},
              isBackNavigation: false,
              transitionId: response["transition"].first["transition"],
            ),
          ),
        );
      }
    } else {
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
            transitionId: response["transition"].first["transition"],
          ),
        ),
      );
    }
    // Clear the navigation path to prevent back button bugs from navigated page
    emit(state.clearNavigationData());
  }

  void _listenButtonChangeEnableStatus() {
    _neoWidgetEventSubscription = [
      (
        NeoWidgetEventKeys.neoButtonChangeEnableStateEventKey,
        (event) {
          final enableState = event.data! as NeoBoButtonEnableState;
          add(NeoBoButtonEventChangeEnableState(enableState: enableState));
        }
      ),
    ].listenEvents();
  }

  void _onChangeEnableState(NeoBoButtonEventChangeEnableState event, Emitter<NeoBoButtonState> emit) {
    emit(NeoBoButtonState(enableState: event.enableState));
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
