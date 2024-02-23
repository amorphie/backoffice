part of 'neo_bo_button_bloc.dart';

sealed class NeoBoButtonEvent extends Equatable {
  const NeoBoButtonEvent();
}

class NeoBoButtonEventInitial extends NeoBoButtonEvent {
  final NeoBoButtonEnableState enableState;

  const NeoBoButtonEventInitial({
    required this.enableState,
  });

  @override
  List<Object?> get props => [enableState];
}

class NeoBoButtonEventInitWorkflow extends NeoBoButtonEvent {
  final Map<String, dynamic> initResponse;

  const NeoBoButtonEventInitWorkflow({required this.initResponse});

  @override
  List<Object?> get props => [initResponse];
}

class NeoBoButtonEventChangeEnableState extends NeoBoButtonEvent {
  final NeoBoButtonEnableState enableState;

  const NeoBoButtonEventChangeEnableState({
    required this.enableState,
  });

  @override
  List<Object?> get props => [enableState];
}
