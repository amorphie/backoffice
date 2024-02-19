part of 'neo_customer_name_widget_bloc.dart';

sealed class NeoCustomerNameWidgetEvent extends Equatable {
  const NeoCustomerNameWidgetEvent();
}

class NeoCustomerNameWidgetEventFetchCustomerName extends NeoCustomerNameWidgetEvent {
  @override
  List<Object?> get props => [];
}
