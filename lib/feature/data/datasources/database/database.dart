import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get name => text()();
  TextColumn get username => text()();
  TextColumn get email => text()();
  TextColumn get phone => text()();
  TextColumn get website => text()();
  IntColumn get addressId => integer().nullable().references(Addresses, #id)();
  IntColumn get companyId => integer().nullable().references(Companies, #id)();
}

@DataClassName('Address')
class Addresses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get street => text()();
  TextColumn get suite => text()();
  TextColumn get city => text()();
  TextColumn get zipcode => text()();
  IntColumn get geoId => integer().nullable().references(Geos, #id)();
}

@DataClassName('Geo')
class Geos extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
}

@DataClassName('Company')
class Companies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get catchPhrase => text()();
  TextColumn get bs => text()();
}

@DriftDatabase(tables: [Users, Addresses, Geos, Companies])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<UserWithRelations>> watchUsersWithRelations() {
    final query = select(users).join([
      leftOuterJoin(addresses, addresses.id.equalsExp(users.addressId)),
      leftOuterJoin(companies, companies.id.equalsExp(users.companyId)),
      leftOuterJoin(geos, geos.id.equalsExp(addresses.geoId)),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return UserWithRelations(
          user: row.readTable(users),
          address: row.readTableOrNull(addresses),
          geo: row.readTableOrNull(geos),
          company: row.readTableOrNull(companies),
        );
      }).toList();
    });
  }

  Future<int> insertGeo(GeosCompanion geo) => into(geos).insert(geo);

  Future<int> insertAddress(AddressesCompanion address) =>
      into(addresses).insert(address);

  Future<int> insertCompany(CompaniesCompanion company) =>
      into(companies).insert(company);

  Future<int> insertUser(UsersCompanion user) => into(users).insert(user);

  Future<int> deleteUserById(int userId) =>
      (delete(users)..where((tbl) => tbl.userId.equals(userId))).go();

  Future<List<UserWithRelations>> getAllUsersWithRelations() async {
    return await watchUsersWithRelations().first;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

class UserWithRelations {
  final User user;
  final Address? address;
  final Geo? geo;
  final Company? company;

  UserWithRelations({required this.user, this.address, this.geo, this.company});
}
