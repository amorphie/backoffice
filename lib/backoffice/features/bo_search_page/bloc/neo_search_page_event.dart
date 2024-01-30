// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

sealed class NeoSearchPageEvent extends Equatable {
  const NeoSearchPageEvent();
}

class NeoSearchPageListViewEventFetchItemList extends NeoSearchPageEvent {
  const NeoSearchPageListViewEventFetchItemList();

  @override
  List<Object?> get props => [];
}

class NeoSearchPageListViewSearchEvent extends NeoSearchPageEvent {
  final String keyword;
  const NeoSearchPageListViewSearchEvent(
    this.keyword,
  );

  @override
  List<Object?> get props => [];
}
