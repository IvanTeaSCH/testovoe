part of 'users_list_bloc.dart';

abstract class UsersListEvent extends Equatable {
  const UsersListEvent();

  @override
  List<Object> get props => [];
}

class UsersListInit extends UsersListEvent {
  @override
  List<Object> get props => [];
}

class UsersListloadEvent extends UsersListEvent {
  @override
  List<Object> get props => [];
}

class UsersListUpdateEvent extends UsersListEvent {
  @override
  List<Object> get props => [];
}

class OnFavoriteEvent extends UsersListEvent {
  final UserEntity user;

  const OnFavoriteEvent({required this.user});
  @override
  List<Object> get props => [user];
}
