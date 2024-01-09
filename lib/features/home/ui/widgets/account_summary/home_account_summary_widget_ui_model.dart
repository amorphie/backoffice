import 'package:backoffice/features/home/ui/widgets/account_summary/models/home_account_summary_component_details_response.dart';

class HomeAccountSummaryWidgetUIModel {
  final String availableLimit;
  final String totalLimit;
  final String currentDebt;
  final String accountOpeningDate;
  final String monthlyInterestRate;
  final String yearlyInterestRate;

  HomeAccountSummaryWidgetUIModel({
    required this.availableLimit,
    required this.totalLimit,
    required this.currentDebt,
    required this.accountOpeningDate,
    required this.monthlyInterestRate,
    required this.yearlyInterestRate,
  });

  HomeAccountSummaryWidgetUIModel.fromResponse(HomeAccountSummaryComponentDetailsResponse response)
      : availableLimit = response.availableLimit,
        totalLimit = response.totalLimit,
        currentDebt = response.currentDebt,
        accountOpeningDate = response.accountOpeningDate,
        monthlyInterestRate = response.monthlyInterestRate,
        yearlyInterestRate = response.yearlyInterestRate;
}
