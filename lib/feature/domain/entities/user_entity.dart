// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final AddressEntity? address;
  final CompanyEntity? company;
  final bool favorite;

  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
    this.favorite = false,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    username,
    email,
    phone,
    website,
    address,
    company,
    favorite,
  ];

  UserEntity copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
    AddressEntity? address,
    CompanyEntity? company,
    bool? favorite,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      address: address ?? this.address,
      company: company ?? this.company,
      favorite: favorite ?? this.favorite,
    );
  }
}

class AddressEntity extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity? geo;

  const AddressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}

class CompanyEntity extends Equatable {
  final String name;
  final String catchPhrase;
  final String bs;

  const CompanyEntity({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}

class GeoEntity extends Equatable {
  final double lat;
  final double lng;

  const GeoEntity({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
