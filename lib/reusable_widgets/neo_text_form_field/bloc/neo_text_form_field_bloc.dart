import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event_bus.dart';

part 'neo_text_form_field_event.dart';
part 'neo_text_form_field_state.dart';

class NeoTextFormFieldBloc extends Bloc<NeoTextFormFieldEvent, NeoTextFormFieldState> {
  String? _error;
  bool? _hasFocus;
  StreamSubscription? _neoWidgetEventSubscription;
  final String? widgetEventKey;

  NeoTextFormFieldBloc({bool? obscureText, this.widgetEventKey}) : super(NeoTextFormFieldState(obscureText: obscureText)) {
    _listenErrorMessage();
    on<NeoTextFormFieldEventUpdateFocus>(_onFocusUpdated);
    on<NeoTextFormFieldEventSetErrorMessage>(_onSetErrorMessage);
    on<NeoTextFormFieldEventChangeObscureStatus>(_onChangeObscure);
  }

  void _listenErrorMessage() {
    _neoWidgetEventSubscription = getIt.get<NeoWidgetEventBus>().listen(
          eventId: NeoWidgetEventKeys.neoTextFormFieldSetErrorMessageEventKey.name + (widgetEventKey ?? ''),
          onEventReceived: (NeoWidgetEvent event) {
            final error = event.data! as String;
            add(NeoTextFormFieldEventSetErrorMessage(errorMessage: error));
          },
        );
  }

  void _onFocusUpdated(NeoTextFormFieldEventUpdateFocus event, Emitter<NeoTextFormFieldState> emit) {
    _hasFocus = event.focus;
    emit(state.copyWith(hasFocus: _hasFocus, error: _error));
  }

  void _onChangeObscure(NeoTextFormFieldEventChangeObscureStatus event, Emitter<NeoTextFormFieldState> emit) {
    if (state.obscureText == null) {
      return;
    }
    emit(state.copyWith(obscureText: !state.obscureText!));
  }

  void _onSetErrorMessage(NeoTextFormFieldEventSetErrorMessage event, Emitter<NeoTextFormFieldState> emit) {
    emit(state.copyWith(error: event.errorMessage));
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
