import 'package:equatable/equatable.dart';

sealed class NeoSearchPageEvent extends Equatable {
  const NeoSearchPageEvent();
}

class NeoSearchPageListViewEventFetchItemList extends NeoSearchPageEvent {
  const NeoSearchPageListViewEventFetchItemList();

  @override
  List<Object?> get props => [];
}
