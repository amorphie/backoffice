part of 'neo_bo_button_bloc.dart';

class NeoBoButtonState extends Equatable {
  final SignalrTransitionData? navigationData;
  final NeoBoButtonEnableState? enableState;

  const NeoBoButtonState({this.enableState, this.navigationData});

  @override
  List<Object?> get props => [navigationData, enableState];

  NeoBoButtonState copyWith({
    SignalrTransitionData? navigationData,
    NeoBoButtonEnableState? enableState,
  }) {
    return NeoBoButtonState(
      navigationData: navigationData ?? this.navigationData,
      enableState: enableState ?? this.enableState,
    );
  }

  NeoBoButtonState clearNavigationData() {
    return NeoBoButtonState(enableState: enableState);
  }
}
