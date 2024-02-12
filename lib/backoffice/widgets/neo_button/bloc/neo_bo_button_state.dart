part of 'neo_bo_button_bloc.dart';

class NeoBoButtonState extends Equatable {
  final SignalrTransitionData? navigationData;
  final bool? buttonEnabled;

  const NeoBoButtonState({this.buttonEnabled, this.navigationData});

  @override
  List<Object?> get props => [navigationData, buttonEnabled];
}
