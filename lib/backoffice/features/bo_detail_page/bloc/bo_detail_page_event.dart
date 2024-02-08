import 'package:equatable/equatable.dart';

sealed class BoDetailPageEvent extends Equatable {
  const BoDetailPageEvent();
}

class BoDetailPageEventSetItem extends BoDetailPageEvent {
  const BoDetailPageEventSetItem();

  @override
  List<Object?> get props => [];
}
