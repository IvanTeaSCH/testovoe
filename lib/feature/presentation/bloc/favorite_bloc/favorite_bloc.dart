import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/domain/usecases/delete_favorite_user.dart';
import 'package:testovoe/feature/domain/usecases/get_all_favorite.dart';
import 'package:testovoe/feature/domain/usecases/get_favorite_user.dart';
import 'package:testovoe/feature/domain/usecases/save_favorite_user.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    required this.getAllFavoritePersons,
    required this.deleteFavoritePerson,
    required this.saveFavoritePerson,
    required this.getFavoritePersons,
  }) : super(FavoriteLoading()) {
    on<FavoriteInit>(_init);
    on<FavoriteUpdateEvent>(_update);
    on<OnFavoriteEvent>(_onFavorite);
    _subscribtionFavorite();
  }
  final SaveFavoriteUser saveFavoritePerson;
  final GetFavoriteUsers getFavoritePersons;
  final GetAllFavoritePersons getAllFavoritePersons;
  final DeleteFavoriteUser deleteFavoritePerson;

  int page = 1;
  final scrollController = ScrollController();
  List<UserEntity> personsFavorite = [];

  Future<void> _init(FavoriteInit event, Emitter<FavoriteState> emit) async {
    personsFavorite = await getAllFavoritePersons();
    add(FavoriteUpdateEvent());
  }

  Future<void> _update(
    FavoriteUpdateEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    if (personsFavorite.isEmpty) {
      emit(FavoriteEmpty());
    } else {
      emit(
        FavoriteLoaded(
          personsFavorite.map((e) => e.copyWith(favorite: true)).toList(),
        ),
      );
    }
  }

  Future<void> _onFavorite(
    OnFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    if (!event.person.favorite) {
      await saveFavoritePerson.call(UserParams(person: event.person));
    } else {
      await deleteFavoritePerson.call(UserParams(person: event.person));
    }
  }

  void _subscribtionFavorite() {
    getFavoritePersons.call().listen((persons) {
      personsFavorite = persons;
      add(FavoriteUpdateEvent());
    });
  }
}
