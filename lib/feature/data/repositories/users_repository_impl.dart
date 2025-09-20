import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:testovoe/core/error/exeption.dart';
import 'package:testovoe/core/error/failure.dart';
import 'package:testovoe/core/platform/network_info.dart';
import 'package:testovoe/feature/data/datasources/user_favorite_data_source.dart';
import 'package:testovoe/feature/data/datasources/user_local_data_source.dart';
import 'package:testovoe/feature/data/datasources/user_remote_data_sources.dart';
import 'package:testovoe/feature/data/models/user_model.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class PersonRepositoryImpl implements UserRepository {
  final PersonRemoteDataSource remoteDataSource;
  final UserRemoteFavoriteDataSource remoteFavoriteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl({
    required this.remoteDataSource,
    required this.remoteFavoriteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<UserEntity>>> getAllPersons() async {
    return await _getPersons(() {
      return remoteDataSource.getAllUsers();
    });
  }

  Future<Either<Failure, List<UserModel>>> _getPersons(
    Future<List<UserModel>> Function() getPersons,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await getPersons();
        localDataSource.usersToCache(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPerson = await localDataSource.getLastUsersFromCache();
        return Right(localPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Stream<List<UserEntity>> getFavoriteUsers() {
    return remoteFavoriteDataSource.getFavoriteUsers();
  }

  @override
  Future<void> saveFavoriteUser(UserEntity person) async {
    await remoteFavoriteDataSource.saveFavoriteUsers(person);
  }

  @override
  Future<void> deleteFavoritePerson(UserEntity person) async {
    await remoteFavoriteDataSource.deleteFavoriteUser(person);
  }

  @override
  Future<List<UserEntity>> getAllFavorite() async {
    return await remoteFavoriteDataSource.getAllFavorite();
  }
}
