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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

part 'neo_scaffold_event.dart';
part 'neo_scaffold_state.dart';

class NeoScaffoldBloc extends Bloc<NeoScaffoldEvent, NeoScaffoldState> {
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;
  Color? _backgroundColor;

  NeoScaffoldBloc() : super(const NeoScaffoldState()) {
    on<NeoScaffoldEventInitialize>(_onInitialize);
    on<NeoScaffoldEventChangeBackgroundColor>(_onChangeBackgroundColor);
    on<NeoScaffoldEventBackButtonPressed>(_onBackButtonPressed);
  }

  _onInitialize(NeoScaffoldEventInitialize event, Emitter<NeoScaffoldState> emit) {
    _neoWidgetEventSubscription = [
      // STOPSHIP: Remove these events, use instead NeoWidgetEventKeys.commonNeoScaffoldChangeBackgroundColor
      (NeoWidgetEventKeys.loginTextFieldFocused, (_) => add(NeoScaffoldEventChangeBackgroundColor(backgroundColor: NeoColors.bgLight))),
      (NeoWidgetEventKeys.loginTextFieldUnfocused, (_) => add(const NeoScaffoldEventChangeBackgroundColor(backgroundColor: Colors.transparent))),
    ].listenEvents();
  }

  _onChangeBackgroundColor(NeoScaffoldEventChangeBackgroundColor event, Emitter<NeoScaffoldState> emit) {
    _backgroundColor = event.backgroundColor;
    emit(NeoScaffoldState(backgroundColor: _backgroundColor));
  }

  _onBackButtonPressed(NeoScaffoldEventBackButtonPressed event, Emitter<NeoScaffoldState> emit) {
    if (event.widgetEventKey != null) {
      getIt.get<NeoWidgetEventBus>().addEvent(NeoWidgetEvent(eventId: event.widgetEventKey.orEmpty));
    } else {
      NeoWidgetEventKeys.neoAppBarPressBackButton.sendEvent();
    }
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
