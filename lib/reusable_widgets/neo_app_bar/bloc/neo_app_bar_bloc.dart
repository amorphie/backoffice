/*
 * neo_bank
 *
 * Created on 22/12/2023.
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

part 'neo_app_bar_event.dart';
part 'neo_app_bar_state.dart';

class NeoAppBarBloc extends Bloc<NeoAppBarEvent, NeoAppBarState> {
  StreamSubscription? _widgetEventBusSubscription;

  NeoAppBarBloc() : super(const NeoAppBarState()) {
    _listenForDeviceBackButton();

    on<NeoAppBarEventPressDeviceBack>((event, emit) {
      emit(NeoAppBarState(backButtonPressedTime: event.eventTime));
      emit(const NeoAppBarState()); // Remove pressed time from state to prevent possible bugs
    });
  }

  void _listenForDeviceBackButton() {
    _widgetEventBusSubscription = NeoWidgetEventKeys.neoAppBarPressBackButton.listenEvent(
      onEventReceived: (_) => add(NeoAppBarEventPressDeviceBack()),
    );
  }

  @override
  Future<void> close() {
    _widgetEventBusSubscription?.cancel();
    return super.close();
  }
}
