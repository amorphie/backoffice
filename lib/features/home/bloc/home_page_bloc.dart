import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_component_tree_builder/network/i_components_network_manager.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IComponentsNetworkManager componentsNetworkManager;
  late final StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  HomePageBloc({required this.componentsNetworkManager}) : super(HomePageStateInitial()) {
    _listenForWidgetEvents();

    on<HomePageEventLogOutUser>((event, emit) => emit(HomePageStateLoggedOut()));
  }

  _listenForWidgetEvents() {
    _neoWidgetEventSubscription = NeoWidgetEventKeys.logoutDialogConfirm.listenEvent(
      onEventReceived: (_) => add(HomePageEventLogOutUser()),
    );
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
