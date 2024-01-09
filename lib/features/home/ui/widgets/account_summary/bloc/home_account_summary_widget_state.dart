part of 'home_account_summary_widget_bloc.dart';

sealed class HomeAccountSummaryWidgetState extends Equatable {}

class HomeAccountSummaryWidgetStateLoading extends HomeAccountSummaryWidgetState {
  @override
  List<Object> get props => [];
}

class AccountSummaryWidgetStateLoaded extends HomeAccountSummaryWidgetState {
  final HomeAccountSummaryWidgetUIModel uiModel;

  AccountSummaryWidgetStateLoaded(this.uiModel);

  @override
  List<Object?> get props => [uiModel];
}
