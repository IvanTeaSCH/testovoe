import 'package:drift/drift.dart';
import 'package:testovoe/feature/data/datasources/database/database.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';

class UserDataMapper {
  static UserEntity toEntity(UserWithRelations data) {
    return UserEntity(
      id: data.user.userId,
      name: data.user.name,
      username: data.user.username,
      email: data.user.email,
      phone: data.user.phone,
      website: data.user.website,
      address: data.address != null
          ? AddressDataMapper.toEntity(data.address!, data.geo)
          : null,
      company: data.company != null
          ? CompanyDataMapper.toEntity(data.company!)
          : null,
    );
  }

  static UsersCompanion toCompanion(
    UserEntity entity, {
    int? addressId,
    int? companyId,
  }) {
    return UsersCompanion.insert(
      userId: entity.id,
      name: entity.name,
      username: entity.username,
      email: entity.email,
      phone: entity.phone,
      website: entity.website,
      addressId: Value(addressId),
      companyId: Value(companyId),
    );
  }
}

class AddressDataMapper {
  static AddressEntity toEntity(Address data, Geo? geo) {
    return AddressEntity(
      street: data.street,
      suite: data.suite,
      city: data.city,
      zipcode: data.zipcode,
      geo: geo != null ? GeoDataMapper.toEntity(geo) : null,
    );
  }

  static AddressesCompanion toCompanion(AddressEntity entity, {int? geoId}) {
    return AddressesCompanion.insert(
      street: entity.street,
      suite: entity.suite,
      city: entity.city,
      zipcode: entity.zipcode,
      geoId: Value(geoId),
    );
  }
}

class GeoDataMapper {
  static GeoEntity toEntity(Geo data) {
    return GeoEntity(lat: data.lat, lng: data.lng);
  }

  static GeosCompanion toCompanion(GeoEntity entity) {
    return GeosCompanion.insert(lat: entity.lat, lng: entity.lng);
  }
}

class CompanyDataMapper {
  static CompanyEntity toEntity(Company data) {
    return CompanyEntity(
      name: data.name,
      catchPhrase: data.catchPhrase,
      bs: data.bs,
    );
  }

  static CompaniesCompanion toCompanion(CompanyEntity entity) {
    return CompaniesCompanion.insert(
      name: entity.name,
      catchPhrase: entity.catchPhrase,
      bs: entity.bs,
    );
  }
}
