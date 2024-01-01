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
import 'package:admin/core/dependency_injection/dependency_injection.dart';
import 'package:admin/core/util/constants/neo_colors.dart';
import 'package:admin/core/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

part 'neo_scaffold_event.dart';
part 'neo_scaffold_state.dart';

class NeoScaffoldBloc extends Bloc<NeoScaffoldEvent, NeoScaffoldState> {
  late final StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;
  Color? _backgroundColor;

  NeoScaffoldBloc() : super(const NeoScaffoldState(backgroundColor: Colors.transparent)) {
    on<NeoScaffoldEventInitialize>(_onInitialize);
    on<NeoScaffoldEventChangeBackgroundColor>(_onChangeBackgroundColor);
    on<NeoScaffoldEventBackButtonPressed>(_onBackButtonPressed);
  }

  _onInitialize(NeoScaffoldEventInitialize event, Emitter<NeoScaffoldState> emit) {
    _neoWidgetEventSubscription = getIt.get<NeoWidgetEventBus>().listenEvents(
      eventIds: [
        // STOPSHIP: Remove these events, use instead NeoWidgetEventKeys.commonNeoScaffoldChangeBackgroundColor
        NeoWidgetEventKeys.loginTextFieldFocused.name,
        NeoWidgetEventKeys.loginTextFieldUnfocused.name,
      ],
      onEventReceived: (event) {
        if (event.eventId == NeoWidgetEventKeys.loginTextFieldFocused.name) {
          add(const NeoScaffoldEventChangeBackgroundColor(backgroundColor: NeoColors.bgLight));
        } else if (event.eventId == NeoWidgetEventKeys.loginTextFieldUnfocused.name) {
          add(const NeoScaffoldEventChangeBackgroundColor(backgroundColor: Colors.transparent));
        }
      },
    );
  }

  _onChangeBackgroundColor(NeoScaffoldEventChangeBackgroundColor event, Emitter<NeoScaffoldState> emit) {
    _backgroundColor = event.backgroundColor;
    emit(NeoScaffoldState(backgroundColor: _backgroundColor));
  }

  _onBackButtonPressed(NeoScaffoldEventBackButtonPressed event, Emitter<NeoScaffoldState> emit) {
    getIt.get<NeoWidgetEventBus>().addEvent(NeoWidgetEvent(eventId: NeoWidgetEventKeys.neoAppBarPressBackButton.name));
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
