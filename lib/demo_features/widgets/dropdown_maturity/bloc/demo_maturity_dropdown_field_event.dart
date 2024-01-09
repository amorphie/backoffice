part of 'demo_maturity_dropdown_field_bloc.dart';

abstract class DemoMaturityDropdownFieldEvent extends Equatable {
  const DemoMaturityDropdownFieldEvent();
}

class DemoMaturityNetworkDropdownFieldEventInitialGet extends DemoMaturityDropdownFieldEvent {
  final String endpoint;

  const DemoMaturityNetworkDropdownFieldEventInitialGet(this.endpoint);

  @override
  List<Object?> get props => [endpoint];
}
