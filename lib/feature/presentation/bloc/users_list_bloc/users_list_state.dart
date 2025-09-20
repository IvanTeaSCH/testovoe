// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_list_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState(this.scrollController);

  final ScrollController scrollController;

  @override
  List<Object> get props => [scrollController];
}

class UsersEmpty extends UsersState {
  const UsersEmpty(super.scrollController);

  @override
  List<Object> get props => [];
}

class UsersLoading extends UsersState {
  const UsersLoading(super.scrollController);

  @override
  List<Object> get props => [];
}

class PersonLoaded extends UsersState {
  final List<UserEntity> usersList;

  const PersonLoaded(this.usersList, super.scrollController);

  @override
  List<Object> get props => [usersList];
}

class UserError extends UsersState {
  final String message;

  const UserError(super.scrollController, {required this.message});

  @override
  List<Object> get props => [message];
}
