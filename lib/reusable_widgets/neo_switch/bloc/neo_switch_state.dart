import 'package:equatable/equatable.dart';

class NeoSwitchState extends Equatable {
  final bool isEnabled;

  const NeoSwitchState({this.isEnabled = false});

  @override
  List<Object?> get props => [isEnabled];
}
