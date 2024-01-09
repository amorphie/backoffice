part of 'demo_checking_network_dropdown_field_bloc.dart';

abstract class DemoCheckingNetworkDropdownFieldEvent extends Equatable {
  const DemoCheckingNetworkDropdownFieldEvent();
}

class DemoCheckingNetworkDropdownFieldEventInitialGet extends DemoCheckingNetworkDropdownFieldEvent {
  final String endpoint;

  const DemoCheckingNetworkDropdownFieldEventInitialGet(this.endpoint);

  @override
  List<Object?> get props => [endpoint];
}
