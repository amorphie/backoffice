/*
 * neo_bank
 *
 * Created on 21/12/2023.
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
import 'package:admin/core/util/neo_util.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event_bus.dart';

part 'neo_popup_event.dart';
part 'neo_popup_state.dart';

class NeoPopupBloc extends Bloc<NeoPopupEvent, NeoPopupState> {
  StreamSubscription<NeoWidgetEvent>? neoWidgetEventSubscription;

  NeoPopupBloc() : super(NeoPopupStateInitial()) {
    on<NeoPopupEventInitialize>((event, emit) {
      if (!event.widgetEventKeys.isNullOrEmpty) {
        neoWidgetEventSubscription = getIt.get<NeoWidgetEventBus>().listenEvents(
              eventIds: event.widgetEventKeys!,
              onEventReceived: (event) {
                add(NeoPopupEventDismissPopup());
              },
            );
      }
      emit(NeoPopupStateInitial());
    });
    on<NeoPopupEventDismissPopup>((event, emit) {
      emit(NeoPopupStateDismiss());
    });
  }

  @override
  Future<void> close() {
    neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
