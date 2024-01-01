part of 'neo_button_bloc.dart';

class NeoButtonState extends Equatable {
  final SignalrTransitionData? navigationData;
  final bool? buttonEnabled;

  const NeoButtonState({this.buttonEnabled, this.navigationData});

  @override
  List<Object?> get props => [navigationData, buttonEnabled];
}
