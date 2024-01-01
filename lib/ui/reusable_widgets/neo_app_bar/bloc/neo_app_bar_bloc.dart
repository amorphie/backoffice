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
import 'package:admin/core/dependency_injection/dependency_injection.dart';
import 'package:admin/core/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/neo_core.dart';

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
    _widgetEventBusSubscription = getIt.get<NeoWidgetEventBus>().listen(
          eventId: NeoWidgetEventKeys.neoAppBarPressBackButton.name,
          onEventReceived: (event) => add(NeoAppBarEventPressDeviceBack()),
        );
  }

  @override
  Future<void> close() {
    _widgetEventBusSubscription?.cancel();
    return super.close();
  }
}
