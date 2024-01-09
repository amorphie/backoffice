part of 'neo_network_dropdown_form_field_bloc.dart';

sealed class NeoNetworkDropdownFormFieldEvent extends Equatable {
  const NeoNetworkDropdownFormFieldEvent();
}

class NeoNetworkDropdownFormFieldEventFetchItemList extends NeoNetworkDropdownFormFieldEvent {
  final String endpoint;

  const NeoNetworkDropdownFormFieldEventFetchItemList(this.endpoint);

  @override
  List<Object?> get props => [endpoint];
}
