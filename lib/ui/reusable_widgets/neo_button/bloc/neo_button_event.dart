part of 'neo_button_bloc.dart';

sealed class NeoButtonEvent extends Equatable {
  const NeoButtonEvent();
}

class NeoButtonEventInitial extends NeoButtonEvent {
  final bool enabled;

  const NeoButtonEventInitial({
    required this.enabled,
  });

  @override
  List<Object?> get props => [enabled];
}

class NeoButtonEventStartTransition extends NeoButtonEvent {
  final bool startWorkflow;
  final String transitionId;
  final Map<String, dynamic> transitionBody;

  const NeoButtonEventStartTransition({
    required this.startWorkflow,
    required this.transitionId,
    required this.transitionBody,
  });

  @override
  List<Object?> get props => [startWorkflow, transitionId, transitionBody];
}

class NeoButtonEventChangeEnableButtonStatus extends NeoButtonEvent {
  final bool status;

  const NeoButtonEventChangeEnableButtonStatus({
    required this.status,
  });

  @override
  List<Object?> get props => [status];
}
