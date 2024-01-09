/*
 * Neobank.Client
 *
 * Created on 23/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

part 'neo_swipe_button_event.dart';
part 'neo_swipe_button_state.dart';

class NeoSwipeButtonBloc extends Bloc<NeoSwipeButtonEvent, NeoSwipeButtonState> {
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  NeoSwipeButtonBloc() : super(const NeoSwipeButtonState(isLoading: false)) {
    _listenForWidgetEvents();

    on<NeoSwipeButtonEventStopLoading>((event, emit) {
      // Add event to NeoWidgetEventBus here to enable textfields
      NeoWidgetEventKeys.loginEnableUserInterface.sendEvent();
      emit(const NeoSwipeButtonState(isLoading: false));
    });
    on<NeoSwipeButtonEventStartTransaction>((event, emit) {
      // Add event to NeoWidgetEventBus here to disable textfields
      NeoWidgetEventKeys.loginDisableUserInterface.sendEvent();
      emit(const NeoSwipeButtonState(isLoading: true));
    });
    on<NeoSwipeButtonEventShowError>((event, emit) {
      // Add event to NeoWidgetEventBus here to enable textfields
      NeoWidgetEventKeys.loginEnableUserInterface.sendEvent();
      emit(NeoSwipeButtonState(isLoading: false, errorMessage: event.message));
    });
  }

  _listenForWidgetEvents() {
    _neoWidgetEventSubscription = [
      (NeoWidgetEventKeys.neoSwipeButtonStopLoading, (_) => add(NeoSwipeButtonEventStopLoading())),
      (NeoWidgetEventKeys.neoSwipeButtonStartTransaction, (_) => add(NeoSwipeButtonEventStartTransaction())),
    ].listenEvents();
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
