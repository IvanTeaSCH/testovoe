import 'package:dartz/dartz.dart';
import 'package:testovoe/core/error/failure.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getAllPersons();
  Stream<List<UserEntity>> getFavoriteUsers();
  Future<void> saveFavoriteUser(UserEntity person);
  Future<void> deleteFavoritePerson(UserEntity person);
  Future<List<UserEntity>> getAllFavorite();
}
