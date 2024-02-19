part of 'neo_customer_name_widget_bloc.dart';

sealed class NeoCustomerNameWidgetState extends Equatable {
  const NeoCustomerNameWidgetState();
}

class NeoCustomerNameWidgetStateLoading extends NeoCustomerNameWidgetState {
  @override
  List<Object> get props => [];
}

class NeoCustomerNameWidgetStateLoaded extends NeoCustomerNameWidgetState {
  final String customerName;

  const NeoCustomerNameWidgetStateLoaded({required this.customerName});

  @override
  List<Object> get props => [customerName];
}

class NeoCustomerNameWidgetStateError extends NeoCustomerNameWidgetState {
  final String error;

  const NeoCustomerNameWidgetStateError(this.error);

  @override
  List<Object> get props => [error];
}
