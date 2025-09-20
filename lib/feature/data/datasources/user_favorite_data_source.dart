import 'package:injectable/injectable.dart';
import 'package:testovoe/feature/data/datasources/database/drift_service.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';

abstract class UserRemoteFavoriteDataSource {
  Stream<List<UserEntity>> getFavoriteUsers();
  Future<void> saveFavoriteUsers(UserEntity person);
  Future<void> deleteFavoriteUser(UserEntity person);
  Future<List<UserEntity>> getAllFavorite();
}

@LazySingleton(as: UserRemoteFavoriteDataSource)
class UserRemoteFavoriteDataSourceImpl implements UserRemoteFavoriteDataSource {
  UserRemoteFavoriteDataSourceImpl(this.service);

  final DriftUserService service;

  @override
  Stream<List<UserEntity>> getFavoriteUsers() {
    return service.listenFavoriteUser();
  }

  @override
  Future<void> saveFavoriteUsers(UserEntity userEntity) async {
    await service.saveFavoriteUser(userEntity);
  }

  @override
  Future<void> deleteFavoriteUser(UserEntity userEntity) async {
    await service.deleteUser(userEntity.id);
  }

  @override
  Future<List<UserEntity>> getAllFavorite() async {
    return await service.getAllFavorite();
  }
}
