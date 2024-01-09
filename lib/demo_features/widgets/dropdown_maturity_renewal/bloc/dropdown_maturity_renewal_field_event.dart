part of 'dropdown_maturity_renewal_field_bloc.dart';

abstract class DemoMaturityRenewalDropdownFieldEvent extends Equatable {
  const DemoMaturityRenewalDropdownFieldEvent();
}

class DemoMaturityRenewalNetworkDropdownFieldEventInitialGet extends DemoMaturityRenewalDropdownFieldEvent {
  final String endpoint;

  const DemoMaturityRenewalNetworkDropdownFieldEventInitialGet(this.endpoint);

  @override
  List<Object?> get props => [endpoint];
}
