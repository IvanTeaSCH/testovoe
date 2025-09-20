import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationInitEvent>(_init);
    on<NavigationOnPageChangedEvent>(_onPageChanged);
    on<NavigationOnItemTappedEvent>(_onItemTapped);
  }
  int currentIndex = 0;
  PageController pageController = PageController();

  Future<void> _init(
      NavigationInitEvent event, Emitter<NavigationState> emit) async {
    add(NavigationOnPageChangedEvent(index: currentIndex));
  }

  Future<void> _onPageChanged(
      NavigationOnPageChangedEvent event, Emitter<NavigationState> emit) async {
    currentIndex = event.index;
    emit(NavigationScreenState(
      currentIndex: currentIndex,
      pageController: pageController,
    ));
  }

  Future<void> _onItemTapped(
      NavigationOnItemTappedEvent event, Emitter<NavigationState> emit) async {
    pageController.jumpToPage(event.index);
    emit(NavigationScreenState(
      currentIndex: currentIndex,
      pageController: pageController,
    ));
  }
}
