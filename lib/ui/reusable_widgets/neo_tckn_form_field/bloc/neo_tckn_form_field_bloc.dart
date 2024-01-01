/*
 * 
 * neo_bank
 * 
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/core/util/neo_util.dart';

part 'neo_tckn_form_field_event.dart';
part 'neo_tckn_form_field_state.dart';

abstract class _Constants {
  static int tcknLength = 11;
  static int vknLength = 10;
  static RegExp digitRegExp = RegExp(r'\d');
}

class NeoTcknFormFieldBloc extends Bloc<NeoTcknFormFieldEvent, NeoTcknFormFieldState> {
  bool? _hasFocus;
  bool? _hasError;

  NeoTcknFormFieldBloc() : super(const NeoTcknFormFieldState()) {
    on<NeoTcknFormFieldEventUpdateTcknFormField>(_onTcknFormFieldUpdated);
    on<NeoTcknFormFieldEventUpdateFocus>(_onFocusUpdated);
  }

  void _onTcknFormFieldUpdated(NeoTcknFormFieldEventUpdateTcknFormField event, Emitter<NeoTcknFormFieldState> emit) {
    _hasError = !(event.value.isNullOrBlank || _isValidTcknOrVkn(event.value));
    emit(state.copyWith(hasError: _hasError));
  }

  void _onFocusUpdated(NeoTcknFormFieldEventUpdateFocus event, Emitter<NeoTcknFormFieldState> emit) {
    _hasFocus = event.focus;
    emit(state.copyWith(hasFocus: _hasFocus));
  }

  bool _isValidTcknOrVkn(String value) => _isValidTckn(value) || _isValidVkn(value);

  bool _isValidTckn(String value) {
    return _hasCorrectLength(value) && _firstDigitNotZero(value) && _lastDigitEven(value) && _tenthDigitValid(value) && _lastDigitValid(value);
  }

  bool _hasCorrectLength(String value) {
    return value.length == _Constants.tcknLength;
  }

  bool _firstDigitNotZero(String value) {
    return value[0] != '0';
  }

  bool _lastDigitEven(String value) {
    final int lastDigit = int.parse(value[10]);
    return lastDigit.isEven;
  }

  bool _tenthDigitValid(String value) {
    int sumOddDigits = 0;
    int sumEvenDigits = 0;

    for (int i = 0; i < 9; i++) {
      final int digit = int.parse(value.substring(i, i + 1));
      if (i.isEven) {
        sumOddDigits += digit;
      } else {
        sumEvenDigits += digit;
      }
    }

    final int tenthDigit = int.parse(value[9]);
    final int mod10Difference = (sumOddDigits * 7 - sumEvenDigits) % 10;
    return tenthDigit == mod10Difference;
  }

  bool _lastDigitValid(String value) {
    final int sumFirstTenDigits = value.substring(0, 10).split('').map(int.parse).reduce((a, b) => a + b);
    final int eleventhDigit = int.parse(value[10]);
    return eleventhDigit == sumFirstTenDigits % 10;
  }

  bool _isValidVkn(String vkn) {
    int tmp;
    int sum = 0;
    if (vkn.length == _Constants.vknLength && _isInt(vkn)) {
      final int lastDigit = int.parse(vkn[9]);
      for (int i = 0; i < 9; i++) {
        final int digit = int.parse(vkn[i]);
        tmp = (digit + 10 - (i + 1)) % 10;
        sum = (tmp == 9 ? sum + tmp : sum + ((tmp * (pow(2, 10 - (i + 1)))) % 9).toInt());
      }
      return lastDigit == (10 - (sum % 10)) % 10;
    }
    return false;
  }

  bool _isInt(String s) {
    for (int a = 0; a < s.length; a++) {
      if (a == 0 && s[a] == '-') {
        continue;
      }
      if (!_Constants.digitRegExp.hasMatch(s[a])) {
        return false;
      }
    }
    return true;
  }
}
