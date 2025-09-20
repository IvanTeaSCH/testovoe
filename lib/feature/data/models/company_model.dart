import 'package:testovoe/feature/domain/entities/user_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({name, catchPhrase, bs})
    : super(name: name, catchPhrase: catchPhrase, bs: bs);

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
  }
}
