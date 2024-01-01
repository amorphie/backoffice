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

sealed class NeoTcknFormFieldEvent extends Equatable {
  const NeoTcknFormFieldEvent();
}

class NeoTcknFormFieldEventUpdateTcknFormField extends NeoTcknFormFieldEvent {
  final String value;

  const NeoTcknFormFieldEventUpdateTcknFormField({required this.value});

  @override
  List<Object?> get props => [value];
}

class NeoTcknFormFieldEventUpdateFocus extends NeoTcknFormFieldEvent {
  final bool focus;

  const NeoTcknFormFieldEventUpdateFocus({required this.focus});

  @override
  List<Object?> get props => [focus];
}
