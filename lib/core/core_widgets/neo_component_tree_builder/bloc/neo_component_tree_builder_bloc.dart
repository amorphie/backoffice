import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_component_tree_builder/network/i_components_network_manager.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/neo_core.dart';

part 'neo_component_tree_builder_event.dart';
part 'neo_component_tree_builder_state.dart';

class NeoComponentTreeBuilderBloc extends Bloc<NeoComponentTreeBuilderEvent, NeoComponentTreeBuilderState> {
  final IComponentsNetworkManager networkManager;
  late String _pageId;
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  NeoComponentTreeBuilderBloc(this.networkManager) : super(NeoComponentTreeBuilderStateLoading()) {
    _listenForWidgetEvents();

    on<NeoComponentTreeBuilderEventInit>((event, emit) async => _pageId = event.pageId);

    on<NeoComponentTreeBuilderEventFetchComponents>((event, emit) async {
      try {
        final response = await networkManager.fetchPageComponentsByPageId(_pageId);
        if (response.isSuccess) {
          emit(NeoComponentTreeBuilderStateLoaded(componentsMap: (response as NeoSuccessResponse).data));
        } else {
          emit(
            NeoComponentTreeBuilderStateError(errorMessage: (response as NeoErrorResponse).error.message),
          );
        }
      } on Exception catch (e) {
        emit(NeoComponentTreeBuilderStateError(errorMessage: e.toString()));
      }
    });
  }

  _listenForWidgetEvents() {
    _neoWidgetEventSubscription = [
      (
        NeoWidgetEventKeys.componentTreeBuilderRetryFetchingComponents,
        (NeoWidgetEvent event) {
          if (_pageId.isNotEmpty && event.data == _pageId) {
            add(const NeoComponentTreeBuilderEventFetchComponents());
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
