part of 'neo_button_bloc.dart';

class NeoButtonState extends Equatable {
  final SignalrTransitionData? navigationData;
  final NeoButtonEnableState? enableState;

  const NeoButtonState({this.enableState, this.navigationData});

  @override
  List<Object?> get props => [navigationData, enableState];

  NeoButtonState copyWith({
    SignalrTransitionData? navigationData,
    NeoButtonEnableState? enableState,
  }) {
    return NeoButtonState(
      navigationData: navigationData ?? this.navigationData,
      enableState: enableState ?? this.enableState,
    );
  }

  NeoButtonState clearNavigationData() {
    return NeoButtonState(enableState: enableState);
  }
}
