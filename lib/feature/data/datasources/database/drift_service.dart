import 'package:injectable/injectable.dart';
import 'package:testovoe/feature/data/datasources/database/database.dart';
import 'package:testovoe/feature/data/models/mapper/user_mapper.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';

@LazySingleton()
class DriftUserService {
  final AppDatabase db;

  DriftUserService(this.db);

  Future<void> saveFavoriteUser(UserEntity userEntity) async {
    final geoId = await db.insertGeo(
      GeoDataMapper.toCompanion(userEntity.address!.geo!),
    );

    final addressId = await db.insertAddress(
      AddressDataMapper.toCompanion(userEntity.address!, geoId: geoId),
    );

    final companyId = await db.insertCompany(
      CompanyDataMapper.toCompanion(userEntity.company!),
    );

    await db.insertUser(
      UserDataMapper.toCompanion(
        userEntity,
        addressId: addressId,
        companyId: companyId,
      ),
    );
  }

  Future<void> deleteUser(int userId) async {
    await db.deleteUserById(userId);
  }

  Future<List<UserEntity>> getAllFavorite() async {
    final list = await db.getAllUsersWithRelations();
    return list.map(UserDataMapper.toEntity).toList();
  }

  Stream<List<UserEntity>> listenFavoriteUser() {
    return db.watchUsersWithRelations().map(
      (rows) => rows.map(UserDataMapper.toEntity).toList(),
    );
  }
}
