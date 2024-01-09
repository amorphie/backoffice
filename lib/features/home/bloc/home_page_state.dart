part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageStateInitial extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageStateLoggedOut extends HomePageState {
  @override
  List<Object> get props => [];
}
