part of 'neo_bottom_navigation_bloc.dart';

sealed class NeoBottomNavigationEvent extends Equatable {
  const NeoBottomNavigationEvent();
}

class NeoBottomNavigationEventChangeTab extends NeoBottomNavigationEvent {
  final int tabIndex;

  const NeoBottomNavigationEventChangeTab(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}
