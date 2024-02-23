part of 'debit_card_limit_information_widget_bloc.dart';

sealed class DebitCardLimitInformationWidgetEvent extends Equatable {
  const DebitCardLimitInformationWidgetEvent();
}

class DebitCardLimitInformationWidgetEventFetchCardDetails extends DebitCardLimitInformationWidgetEvent {
  const DebitCardLimitInformationWidgetEventFetchCardDetails();

  @override
  List<Object?> get props => [];
}
