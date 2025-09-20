part of 'navigation_bloc.dart';

sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}

final class NavigationScreenState extends NavigationState {
  NavigationScreenState({
    required this.currentIndex,
    required this.pageController,
  });

  final int currentIndex;
  final PageController pageController;
}
