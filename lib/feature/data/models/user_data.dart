// import 'package:drift/drift.dart';

// class UserWithRelations {
//   final User user;
//   final Address? address;
//   final Geo? geo;
//   final Company? company;

//   UserWithRelations({
//     required this.user,
//     this.address,
//     this.geo,
//     this.company,
//   });
// }

// class Users extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get userId => integer()();
//   TextColumn get name => text()();
//   TextColumn get username => text()();
//   TextColumn get email => text()();
//   TextColumn get phone => text()();
//   TextColumn get website => text()();

//   IntColumn get addressId => integer().nullable().references(Addresses, #id)();
//   IntColumn get companyId => integer().nullable().references(Companies, #id)();
// }

// class Addresses extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get street => text()();
//   TextColumn get suite => text()();
//   TextColumn get city => text()();
//   TextColumn get zipcode => text()();

//   IntColumn get geoId => integer().nullable().references(Geos, #id)();
// }

// class Geos extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   RealColumn get lat => real()();
//   RealColumn get lng => real()();
// }

// class Companies extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text()();
//   TextColumn get catchPhrase => text()();
//   TextColumn get bs => text()();
// }
