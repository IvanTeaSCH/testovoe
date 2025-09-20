import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testovoe/core/error/failure.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/domain/usecases/delete_favorite_user.dart';
import 'package:testovoe/feature/domain/usecases/get_all_favorite.dart';
import 'package:testovoe/feature/domain/usecases/get_all_users.dart';
import 'package:testovoe/feature/domain/usecases/get_favorite_user.dart';
import 'package:testovoe/feature/domain/usecases/save_favorite_user.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

@injectable
class UsersListBloc extends Bloc<UsersListEvent, UsersState> {
  UsersListBloc({
    required this.getAllFavoriteUsers,
    required this.deleteFavoriteUser,
    required this.saveFavoriteUser,
    required this.getFavoriteUsers,
    required this.getAllUsers,
  }) : super(UsersEmpty(ScrollController())) {
    on<UsersListInit>(_init);
    on<UsersListloadEvent>(_loadUser);
    on<UsersListUpdateEvent>(_update);
    on<OnFavoriteEvent>(_onFavorite);
    _subscribtionFavorite();
  }
  final GetAllUsers getAllUsers;
  final SaveFavoriteUser saveFavoriteUser;
  final GetFavoriteUsers getFavoriteUsers;
  final GetAllFavoritePersons getAllFavoriteUsers;
  final DeleteFavoriteUser deleteFavoriteUser;

  final scrollController = ScrollController();
  List<UserEntity> usersFavorite = [];

  Future<void> _init(UsersListInit event, Emitter<UsersState> emit) async {
    add(UsersListloadEvent());
    usersFavorite = await getAllFavoriteUsers();
  }

  Future<void> _loadUser(
    UsersListloadEvent event,
    Emitter<UsersState> emit,
  ) async {
    if (state is UsersLoading) return;

    emit(UsersLoading(scrollController));

    final failurOrPerson = await getAllUsers();
    await Future.delayed(Duration(milliseconds: 600));

    failurOrPerson.fold(
      (error) => emit(
        UserError(scrollController, message: _mapFailureToMessage(error)),
      ),
      (character) {
        emit(PersonLoaded(checkFavorite(character), scrollController));
      },
    );
  }

  Future<void> _update(
    UsersListUpdateEvent event,
    Emitter<UsersState> emit,
  ) async {
    if (state is UsersLoading || state is UsersEmpty) return;

    final currentState = state;

    var oldUser = <UserEntity>[];
    if (currentState is PersonLoaded) {
      oldUser = currentState.usersList;
    }

    emit(PersonLoaded(checkFavorite(oldUser), scrollController));
  }

  Future<void> _onFavorite(
    OnFavoriteEvent event,
    Emitter<UsersState> emit,
  ) async {
    if (!event.user.favorite) {
      await saveFavoriteUser.call(UserParams(person: event.user));
    } else {
      await deleteFavoriteUser.call(UserParams(person: event.user));
    }
  }

  List<UserEntity> checkFavorite(List<UserEntity> persons) {
    return persons
        .map(
          (person) => usersFavorite.any((p) => p.id == person.id)
              ? person.copyWith(favorite: true)
              : person.copyWith(favorite: false),
        )
        .toList();
  }

  _mapFailureToMessage(Failure failur) {
    switch (failur.runtimeType) {
      case ServerFailure _:
        return 'Server Failure';
      case CacheFailure _:
        return 'Cache Failure';
      default:
        return 'Unexepted Error';
    }
  }

  void _subscribtionFavorite() {
    getFavoriteUsers.call().listen((persons) {
      usersFavorite = persons;
      add(UsersListUpdateEvent());
    });
  }
}
