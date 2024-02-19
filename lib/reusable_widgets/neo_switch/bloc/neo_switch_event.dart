import 'package:equatable/equatable.dart';

sealed class NeoSwitchEvent extends Equatable {
  const NeoSwitchEvent();
}

class NeoSwitchEventToggleValue extends NeoSwitchEvent {
  @override
  List<Object> get props => [];
}

class NeoSwitchEventInitial extends NeoSwitchEvent {
  final bool isEnabled;

  const NeoSwitchEventInitial({this.isEnabled = false});

  @override
  List<Object> get props => [isEnabled];
}
