import 'package:equatable/equatable.dart';

sealed class NeoDebitCardListViewEvent extends Equatable {
  const NeoDebitCardListViewEvent();
}

class NeoDebitCardListViewEventFetchItemList extends NeoDebitCardListViewEvent {
  const NeoDebitCardListViewEventFetchItemList();

  @override
  List<Object?> get props => [];
}
