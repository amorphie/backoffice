part of 'neo_network_dropdown_form_field_bloc.dart';

sealed class NeoNetworkDropdownFormFieldEvent2 extends Equatable {
  const NeoNetworkDropdownFormFieldEvent2();
}

class NeoNetworkDropdownFormFieldEventFetchItemList2 extends NeoNetworkDropdownFormFieldEvent2 {
  final String endpoint;

  const NeoNetworkDropdownFormFieldEventFetchItemList2(this.endpoint);

  @override
  List<Object?> get props => [endpoint];
}
