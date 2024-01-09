import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/localization/localizable_text.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

part 'set_password_bullet_view_event.dart';
part 'set_password_bullet_view_state.dart';

abstract class _Constants {
  static final passwordCountRegex = RegExp(r'^.{6}$');
  static final passwordNumericalRegex = RegExp(r'^\d+$');
  static final consecutiveRegex = RegExp(r'^(?:(?!012|123|234|345|456|567|678|789).)*$');
  static final repeatedRegex = RegExp(r'(\d)\1');
}

class SetPasswordBulletViewBloc extends Bloc<SetPasswordBulletViewEvent, SetPasswordBulletViewState> {
  SetPasswordBulletViewBloc({required this.eventBusPasswordInputKey, required this.eventBusRepeatedPasswordInputKey}) : super(const SetPasswordBulletViewState()) {
    _listenPasswordInput();
    on<SetPasswordBulletViewEventChangeInput>(_onChangeInput);
  }
  final String eventBusPasswordInputKey;
  final String eventBusRepeatedPasswordInputKey;
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;
  String password = '';
  String repeatedPassword = '';

  void _onChangeInput(
    SetPasswordBulletViewEventChangeInput event,
    Emitter<SetPasswordBulletViewState> emit,
  ) {
    if (password.isEmpty) {
      emit(const SetPasswordBulletViewState());
    } else {
      final isCharacterCountMatch = _Constants.passwordCountRegex.hasMatch(password);
      final isPasswordNumerical = _Constants.passwordNumericalRegex.hasMatch(password);
      final isNotConsecutiveAndRepeated = !_Constants.repeatedRegex.hasMatch(password) && _Constants.consecutiveRegex.hasMatch(password);
      final isPasswordsMatch = _checkPasswordsMatch();
      if (isPasswordsMatch && isCharacterCountMatch && isPasswordNumerical && isNotConsecutiveAndRepeated) {
        _changeNeoButtonEnableStatus(true);
      } else {
        _changeNeoButtonEnableStatus(false);
      }
      emit(
        SetPasswordBulletViewState(
          isCharacterCountMatch: isCharacterCountMatch,
          isPasswordNumerical: isPasswordNumerical,
          isNotConsecutiveAndRepeated: isNotConsecutiveAndRepeated,
        ),
      );
    }
  }

  void _listenPasswordInput() {
    _neoWidgetEventSubscription = getIt.get<NeoWidgetEventBus>().listenEvents(
      eventIds: [eventBusPasswordInputKey, eventBusRepeatedPasswordInputKey],
      onEventReceived: (NeoWidgetEvent event) {
        final input = event.data! as String;
        if (eventBusPasswordInputKey == event.eventId) {
          password = input;
        } else {
          repeatedPassword = input;
        }
        add(const SetPasswordBulletViewEventChangeInput());
      },
    );
  }

  bool _checkPasswordsMatch() {
    if (password == repeatedPassword) {
      getIt.get<NeoWidgetEventBus>().addEvent(
            NeoWidgetEvent(
              eventId: NeoWidgetEventKeys.neoTextFormFieldSetErrorMessageEventKey.name + eventBusRepeatedPasswordInputKey,
              data: '',
            ),
          );
      return true;
    } else {
      if (repeatedPassword.isNotEmpty) {
        getIt.get<NeoWidgetEventBus>().addEvent(
              NeoWidgetEvent(
                eventId: NeoWidgetEventKeys.neoTextFormFieldSetErrorMessageEventKey.name + eventBusRepeatedPasswordInputKey,
                data: const LocalizableText(
                  tr: "Girilen şifreler uyuşmuyor",
                  en: "The passwords entered do not match",
                  ar: "يكلمات السر التي تم ادخالها غير مطابقة",
                ).localize(),
              ),
            );
      }
      return false;
    }
  }

  void _changeNeoButtonEnableStatus(bool status) {
    NeoWidgetEventKeys.neoButtonChangeEnableStatusEventKey.sendEvent(data: status);
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
