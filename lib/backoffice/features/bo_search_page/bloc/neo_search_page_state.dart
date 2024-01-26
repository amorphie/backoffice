import 'package:equatable/equatable.dart';

sealed class NeoSearchPageState extends Equatable {
  const NeoSearchPageState();
}

class NeoSearchPageListViewState extends NeoSearchPageState {
  final List? itemList;

  const NeoSearchPageListViewState({this.itemList});

  @override
  List<Object?> get props => [itemList];
}
