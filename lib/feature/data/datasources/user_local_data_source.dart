import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testovoe/core/error/exeption.dart';
import 'package:testovoe/feature/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getLastUsersFromCache();
  Future<void> usersToCache(List<UserModel> persons);
}

// ignore: constant_identifier_names
const CACHED_USERS_LIST = 'CACHED_USERS_LIST';

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<UserModel>> getLastUsersFromCache() {
    final jsonPersonsList = sharedPreferences.getStringList(CACHED_USERS_LIST);
    if (jsonPersonsList!.isNotEmpty) {
      return Future.value(
        jsonPersonsList
            .map((person) => UserModel.fromJson(json.decode(person)))
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> usersToCache(List<UserModel> persons) {
    final List<String> jsonPersonList = persons
        .map((person) => json.encode(person.toJson()))
        .toList();

    sharedPreferences.setStringList(CACHED_USERS_LIST, jsonPersonList);
    return Future.value(jsonPersonList);
  }
}
