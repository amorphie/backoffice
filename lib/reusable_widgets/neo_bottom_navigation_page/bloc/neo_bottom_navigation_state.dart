part of 'neo_bottom_navigation_bloc.dart';

class NeoBottomNavigationState extends Equatable {
  final int currentIndex;

  const NeoBottomNavigationState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
