import 'package:testovoe/feature/data/models/address_model.dart';
import 'package:testovoe/feature/data/models/company_model.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required id,
    required name,
    required username,
    required email,
    required address,
    required phone,
    required website,
    required company,
  }) : super(
         id: id,
         name: name,
         username: username,
         email: email,
         address: address,
         phone: phone,
         website: website,
         company: company,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
      address: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
      company: json['company'] != null
          ? CompanyModel.fromJson(json['company'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
      'address': address,
      'company': company,
    };
  }
}
