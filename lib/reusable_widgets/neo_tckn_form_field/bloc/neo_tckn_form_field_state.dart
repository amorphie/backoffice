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

part of 'neo_tckn_form_field_bloc.dart';

class NeoTcknFormFieldState extends Equatable {
  final bool hasError;
  final bool hasFocus;

  const NeoTcknFormFieldState({
    this.hasError = false,
    this.hasFocus = false,
  });

  NeoTcknFormFieldState copyWith({
    bool? hasError,
    bool? hasFocus,
  }) {
    return NeoTcknFormFieldState(
      hasError: hasError ?? this.hasError,
      hasFocus: hasFocus ?? this.hasFocus,
    );
  }

  @override
  List<Object?> get props => [hasError, hasFocus];
}
