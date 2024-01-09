part of 'neo_text_form_field_bloc.dart';

class NeoTextFormFieldState extends Equatable {
  final String? error;
  final bool hasFocus;
  final bool? obscureText;

  const NeoTextFormFieldState({this.obscureText = false, this.error, this.hasFocus = false});

  @override
  List<Object?> get props => [error, hasFocus, obscureText];

  NeoTextFormFieldState copyWith({
    String? error,
    bool? hasFocus,
    bool? obscureText,
  }) {
    return NeoTextFormFieldState(
      error: error ?? this.error,
      hasFocus: hasFocus ?? this.hasFocus,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
