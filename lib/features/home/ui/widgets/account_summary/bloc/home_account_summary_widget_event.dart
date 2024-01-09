part of 'home_account_summary_widget_bloc.dart';

sealed class HomeAccountSummaryWidgetEvent extends Equatable {}

class HomeAccountSummaryWidgetEventFetchComponentDetails extends HomeAccountSummaryWidgetEvent {
  final String iban;

  HomeAccountSummaryWidgetEventFetchComponentDetails(this.iban);

  @override
  List<Object?> get props => [iban];
}
