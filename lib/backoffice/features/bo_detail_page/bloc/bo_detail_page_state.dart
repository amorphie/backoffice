import 'package:equatable/equatable.dart';

sealed class BoDetailPageState extends Equatable {
  const BoDetailPageState();
}

class BoDetailPageStateSetItem extends BoDetailPageState {
  final Map<String, dynamic>? item;
  const BoDetailPageStateSetItem({this.item});
  @override
  List<Object?> get props => [item];
}

class BoDetailPageStateViewLoading extends BoDetailPageState {
  const BoDetailPageStateViewLoading();

  @override
  List<Object?> get props => [];
}

class BoDetailPageStateViewLoaded extends BoDetailPageState {
  final Map<String, dynamic>? item;
  const BoDetailPageStateViewLoaded({this.item});

  @override
  List<Object?> get props => [item];
}

class BoDetailPageStateViewError extends BoDetailPageState {
  const BoDetailPageStateViewError();

  @override
  List<Object?> get props => [];
}
