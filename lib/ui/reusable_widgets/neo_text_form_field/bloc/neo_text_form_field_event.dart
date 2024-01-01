part of 'neo_text_form_field_bloc.dart';

sealed class NeoTextFormFieldEvent extends Equatable {
  const NeoTextFormFieldEvent();
}

class NeoTextFormFieldEventUpdateFocus extends NeoTextFormFieldEvent {
  final bool focus;

  const NeoTextFormFieldEventUpdateFocus({required this.focus});

  @override
  List<Object?> get props => [focus];
}

class NeoTextFormFieldEventSetErrorMessage extends NeoTextFormFieldEvent {
  final String errorMessage;

  const NeoTextFormFieldEventSetErrorMessage({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class NeoTextFormFieldEventChangeObscureStatus extends NeoTextFormFieldEvent {
  const NeoTextFormFieldEventChangeObscureStatus();

  @override
  List<Object?> get props => [];
}
