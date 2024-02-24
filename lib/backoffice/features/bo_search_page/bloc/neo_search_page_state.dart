import 'package:equatable/equatable.dart';

sealed class NeoSearchPageState extends Equatable {
  const NeoSearchPageState();
}

class NeoSearchPageListViewStateLoaded extends NeoSearchPageState {
  final List? itemList;

  const NeoSearchPageListViewStateLoaded({this.itemList});

  @override
  List<Object?> get props => [itemList];
}

class NeoSearchPageListViewStateLoading extends NeoSearchPageState {
  const NeoSearchPageListViewStateLoading();

  @override
  List<Object?> get props => [];
}

class NeoSearchPageListViewStateError extends NeoSearchPageState {
  const NeoSearchPageListViewStateError();

  @override
  List<Object?> get props => [];
}
