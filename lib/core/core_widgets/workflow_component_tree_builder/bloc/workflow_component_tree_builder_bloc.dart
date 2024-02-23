import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/workflow_component_tree_builder/network/workflow_components_network_manager.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/network/models/neo_response.dart';

part 'workflow_component_tree_builder_event.dart';
part 'workflow_component_tree_builder_state.dart';

class WorkflowComponentTreeBuilderBloc extends Bloc<WorkflowComponentTreeBuilderEvent, WorkflowComponentTreeBuilderState> {
  final WorkflowComponentsNetworkManager networkManager;
  late String _source;
  late String _pageId;
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  WorkflowComponentTreeBuilderBloc(this.networkManager) : super(WorkflowComponentTreeBuilderStateLoading()) {
    _listenForWidgetEvents();

    on<WorkflowComponentTreeBuilderEventInit>((event, emit) async {
      _source = event.source;
      _pageId = event.pageId;
    });

    on<WorkflowComponentTreeBuilderEventFetchComponents>((event, emit) async {
      try {
        var response;
        response = await networkManager.fetchPageComponents(_source, _pageId);
        if (response.isSuccess) {
          final componentsResponse = jsonEncode((response as NeoSuccessResponse).data["body"]);
          emit(
            WorkflowComponentTreeBuilderStateLoaded(componentsMap: jsonDecode(componentsResponse)),
          );
        } else {
          response = await networkManager.fetchFormioPageComponents(_source, _pageId);
          if (response.isSuccess) {
            final componentsResponse = (response as NeoSuccessResponse).data["body"];
            emit(
              WorkflowFormioBuilderStateLoaded(formioData: componentsResponse, transitionId: _pageId),
            );
          } else {
            emit(
              WorkflowComponentTreeBuilderStateError(errorMessage: (response as NeoErrorResponse).error.message),
            );
          }
        }
      } on Exception catch (e) {
        emit(WorkflowComponentTreeBuilderStateError(errorMessage: e.toString()));
      }
    });
  }

  _listenForWidgetEvents() {
    _neoWidgetEventSubscription = [
      (
        NeoWidgetEventKeys.componentTreeBuilderRetryFetchingComponents,
        (NeoWidgetEvent event) {
          if (_pageId.isNotEmpty && event.data == _pageId) {
            add(WorkflowComponentTreeBuilderEventFetchComponents());
          }
        },
      ),
    ].listenEvents();
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
