part of 'neo_button_bloc.dart';

sealed class NeoButtonEvent extends Equatable {
  const NeoButtonEvent();
}

class NeoButtonEventInitial extends NeoButtonEvent {
  final NeoButtonEnableState enableState;

  const NeoButtonEventInitial({
    required this.enableState,
  });

  @override
  List<Object?> get props => [enableState];
}

class NeoButtonEventInitWorkflow extends NeoButtonEvent {
  final Map<String, dynamic> initResponse;

  const NeoButtonEventInitWorkflow({required this.initResponse});

  @override
  List<Object?> get props => [initResponse];
}

class NeoButtonEventChangeEnableState extends NeoButtonEvent {
  final NeoButtonEnableState enableState;

  const NeoButtonEventChangeEnableState({
    required this.enableState,
  });

  @override
  List<Object?> get props => [enableState];
}
