part of 'neo_bo_button_bloc.dart';

sealed class NeoBoButtonEvent extends Equatable {
  const NeoBoButtonEvent();
}

class NeoBoButtonEventInitial extends NeoBoButtonEvent {
  final bool enabled;

  const NeoBoButtonEventInitial({
    required this.enabled,
  });

  @override
  List<Object?> get props => [enabled];
}

class NeoBoButtonEventStartTransition extends NeoBoButtonEvent {
  final bool startWorkflow;
  final String transitionId;
  final Map<String, dynamic> transitionBody;

  const NeoBoButtonEventStartTransition({
    required this.startWorkflow,
    required this.transitionId,
    required this.transitionBody,
  });

  @override
  List<Object?> get props => [startWorkflow, transitionId, transitionBody];
}

class NeoBoButtonEventChangeEnableButtonStatus extends NeoBoButtonEvent {
  final bool status;

  const NeoBoButtonEventChangeEnableButtonStatus({
    required this.status,
  });

  @override
  List<Object?> get props => [status];
}
