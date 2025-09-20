import 'package:testovoe/feature/domain/entities/user_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({street, suite, city, zipcode, geo})
    : super(
        street: street,
        suite: suite,
        city: city,
        zipcode: zipcode,
        geo: geo,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: GeoModel.fromJson(json['geo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo,
    };
  }
}

class GeoModel extends GeoEntity {
  GeoModel({lat, lng}) : super(lat: lat, lng: lng);

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: double.parse(json['lat'] as String),
      lng: double.parse(json['lng'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}
