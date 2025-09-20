part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteInit extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class FavoriteUpdateEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class OnFavoriteEvent extends FavoriteEvent {
  final UserEntity person;

  const OnFavoriteEvent({required this.person});
  @override
  List<Object> get props => [person];
}
