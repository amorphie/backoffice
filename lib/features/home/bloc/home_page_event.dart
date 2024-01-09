part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class HomePageEventLogOutUser extends HomePageEvent {
  @override
  List<Object?> get props => [];
}
