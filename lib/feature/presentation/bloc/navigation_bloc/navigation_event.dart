part of 'navigation_bloc.dart';

sealed class NavigationEvent {}

final class NavigationInitEvent extends NavigationEvent {}

final class NavigationOnPageChangedEvent extends NavigationEvent {
  NavigationOnPageChangedEvent({required this.index});

  final int index;
}

final class NavigationOnItemTappedEvent extends NavigationEvent {
  NavigationOnItemTappedEvent({required this.index});

  final int index;
}
