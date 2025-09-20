// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GeosTable extends Geos with TableInfo<$GeosTable, Geo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, lat, lng];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Geo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Geo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Geo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
    );
  }

  @override
  $GeosTable createAlias(String alias) {
    return $GeosTable(attachedDatabase, alias);
  }
}

class Geo extends DataClass implements Insertable<Geo> {
  final int id;
  final double lat;
  final double lng;
  const Geo({required this.id, required this.lat, required this.lng});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    return map;
  }

  GeosCompanion toCompanion(bool nullToAbsent) {
    return GeosCompanion(id: Value(id), lat: Value(lat), lng: Value(lng));
  }

  factory Geo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Geo(
      id: serializer.fromJson<int>(json['id']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
    };
  }

  Geo copyWith({int? id, double? lat, double? lng}) =>
      Geo(id: id ?? this.id, lat: lat ?? this.lat, lng: lng ?? this.lng);
  Geo copyWithCompanion(GeosCompanion data) {
    return Geo(
      id: data.id.present ? data.id.value : this.id,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Geo(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lat, lng);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Geo &&
          other.id == this.id &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class GeosCompanion extends UpdateCompanion<Geo> {
  final Value<int> id;
  final Value<double> lat;
  final Value<double> lng;
  const GeosCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
  });
  GeosCompanion.insert({
    this.id = const Value.absent(),
    required double lat,
    required double lng,
  }) : lat = Value(lat),
       lng = Value(lng);
  static Insertable<Geo> custom({
    Expression<int>? id,
    Expression<double>? lat,
    Expression<double>? lng,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
    });
  }

  GeosCompanion copyWith({
    Value<int>? id,
    Value<double>? lat,
    Value<double>? lng,
  }) {
    return GeosCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeosCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }
}

class $AddressesTable extends Addresses
    with TableInfo<$AddressesTable, Address> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
    'street',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _suiteMeta = const VerificationMeta('suite');
  @override
  late final GeneratedColumn<String> suite = GeneratedColumn<String>(
    'suite',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _zipcodeMeta = const VerificationMeta(
    'zipcode',
  );
  @override
  late final GeneratedColumn<String> zipcode = GeneratedColumn<String>(
    'zipcode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _geoIdMeta = const VerificationMeta('geoId');
  @override
  late final GeneratedColumn<int> geoId = GeneratedColumn<int>(
    'geo_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES geos (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    street,
    suite,
    city,
    zipcode,
    geoId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'addresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Address> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('street')) {
      context.handle(
        _streetMeta,
        street.isAcceptableOrUnknown(data['street']!, _streetMeta),
      );
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('suite')) {
      context.handle(
        _suiteMeta,
        suite.isAcceptableOrUnknown(data['suite']!, _suiteMeta),
      );
    } else if (isInserting) {
      context.missing(_suiteMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('zipcode')) {
      context.handle(
        _zipcodeMeta,
        zipcode.isAcceptableOrUnknown(data['zipcode']!, _zipcodeMeta),
      );
    } else if (isInserting) {
      context.missing(_zipcodeMeta);
    }
    if (data.containsKey('geo_id')) {
      context.handle(
        _geoIdMeta,
        geoId.isAcceptableOrUnknown(data['geo_id']!, _geoIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Address map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Address(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      street: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}street'],
      )!,
      suite: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}suite'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      zipcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zipcode'],
      )!,
      geoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}geo_id'],
      ),
    );
  }

  @override
  $AddressesTable createAlias(String alias) {
    return $AddressesTable(attachedDatabase, alias);
  }
}

class Address extends DataClass implements Insertable<Address> {
  final int id;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final int? geoId;
  const Address({
    required this.id,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    this.geoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['street'] = Variable<String>(street);
    map['suite'] = Variable<String>(suite);
    map['city'] = Variable<String>(city);
    map['zipcode'] = Variable<String>(zipcode);
    if (!nullToAbsent || geoId != null) {
      map['geo_id'] = Variable<int>(geoId);
    }
    return map;
  }

  AddressesCompanion toCompanion(bool nullToAbsent) {
    return AddressesCompanion(
      id: Value(id),
      street: Value(street),
      suite: Value(suite),
      city: Value(city),
      zipcode: Value(zipcode),
      geoId: geoId == null && nullToAbsent
          ? const Value.absent()
          : Value(geoId),
    );
  }

  factory Address.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Address(
      id: serializer.fromJson<int>(json['id']),
      street: serializer.fromJson<String>(json['street']),
      suite: serializer.fromJson<String>(json['suite']),
      city: serializer.fromJson<String>(json['city']),
      zipcode: serializer.fromJson<String>(json['zipcode']),
      geoId: serializer.fromJson<int?>(json['geoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'street': serializer.toJson<String>(street),
      'suite': serializer.toJson<String>(suite),
      'city': serializer.toJson<String>(city),
      'zipcode': serializer.toJson<String>(zipcode),
      'geoId': serializer.toJson<int?>(geoId),
    };
  }

  Address copyWith({
    int? id,
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Value<int?> geoId = const Value.absent(),
  }) => Address(
    id: id ?? this.id,
    street: street ?? this.street,
    suite: suite ?? this.suite,
    city: city ?? this.city,
    zipcode: zipcode ?? this.zipcode,
    geoId: geoId.present ? geoId.value : this.geoId,
  );
  Address copyWithCompanion(AddressesCompanion data) {
    return Address(
      id: data.id.present ? data.id.value : this.id,
      street: data.street.present ? data.street.value : this.street,
      suite: data.suite.present ? data.suite.value : this.suite,
      city: data.city.present ? data.city.value : this.city,
      zipcode: data.zipcode.present ? data.zipcode.value : this.zipcode,
      geoId: data.geoId.present ? data.geoId.value : this.geoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Address(')
          ..write('id: $id, ')
          ..write('street: $street, ')
          ..write('suite: $suite, ')
          ..write('city: $city, ')
          ..write('zipcode: $zipcode, ')
          ..write('geoId: $geoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, street, suite, city, zipcode, geoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Address &&
          other.id == this.id &&
          other.street == this.street &&
          other.suite == this.suite &&
          other.city == this.city &&
          other.zipcode == this.zipcode &&
          other.geoId == this.geoId);
}

class AddressesCompanion extends UpdateCompanion<Address> {
  final Value<int> id;
  final Value<String> street;
  final Value<String> suite;
  final Value<String> city;
  final Value<String> zipcode;
  final Value<int?> geoId;
  const AddressesCompanion({
    this.id = const Value.absent(),
    this.street = const Value.absent(),
    this.suite = const Value.absent(),
    this.city = const Value.absent(),
    this.zipcode = const Value.absent(),
    this.geoId = const Value.absent(),
  });
  AddressesCompanion.insert({
    this.id = const Value.absent(),
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    this.geoId = const Value.absent(),
  }) : street = Value(street),
       suite = Value(suite),
       city = Value(city),
       zipcode = Value(zipcode);
  static Insertable<Address> custom({
    Expression<int>? id,
    Expression<String>? street,
    Expression<String>? suite,
    Expression<String>? city,
    Expression<String>? zipcode,
    Expression<int>? geoId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (street != null) 'street': street,
      if (suite != null) 'suite': suite,
      if (city != null) 'city': city,
      if (zipcode != null) 'zipcode': zipcode,
      if (geoId != null) 'geo_id': geoId,
    });
  }

  AddressesCompanion copyWith({
    Value<int>? id,
    Value<String>? street,
    Value<String>? suite,
    Value<String>? city,
    Value<String>? zipcode,
    Value<int?>? geoId,
  }) {
    return AddressesCompanion(
      id: id ?? this.id,
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geoId: geoId ?? this.geoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (suite.present) {
      map['suite'] = Variable<String>(suite.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (zipcode.present) {
      map['zipcode'] = Variable<String>(zipcode.value);
    }
    if (geoId.present) {
      map['geo_id'] = Variable<int>(geoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddressesCompanion(')
          ..write('id: $id, ')
          ..write('street: $street, ')
          ..write('suite: $suite, ')
          ..write('city: $city, ')
          ..write('zipcode: $zipcode, ')
          ..write('geoId: $geoId')
          ..write(')'))
        .toString();
  }
}

class $CompaniesTable extends Companies
    with TableInfo<$CompaniesTable, Company> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompaniesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _catchPhraseMeta = const VerificationMeta(
    'catchPhrase',
  );
  @override
  late final GeneratedColumn<String> catchPhrase = GeneratedColumn<String>(
    'catch_phrase',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bsMeta = const VerificationMeta('bs');
  @override
  late final GeneratedColumn<String> bs = GeneratedColumn<String>(
    'bs',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, catchPhrase, bs];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'companies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Company> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('catch_phrase')) {
      context.handle(
        _catchPhraseMeta,
        catchPhrase.isAcceptableOrUnknown(
          data['catch_phrase']!,
          _catchPhraseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_catchPhraseMeta);
    }
    if (data.containsKey('bs')) {
      context.handle(_bsMeta, bs.isAcceptableOrUnknown(data['bs']!, _bsMeta));
    } else if (isInserting) {
      context.missing(_bsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Company map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Company(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      catchPhrase: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catch_phrase'],
      )!,
      bs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bs'],
      )!,
    );
  }

  @override
  $CompaniesTable createAlias(String alias) {
    return $CompaniesTable(attachedDatabase, alias);
  }
}

class Company extends DataClass implements Insertable<Company> {
  final int id;
  final String name;
  final String catchPhrase;
  final String bs;
  const Company({
    required this.id,
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['catch_phrase'] = Variable<String>(catchPhrase);
    map['bs'] = Variable<String>(bs);
    return map;
  }

  CompaniesCompanion toCompanion(bool nullToAbsent) {
    return CompaniesCompanion(
      id: Value(id),
      name: Value(name),
      catchPhrase: Value(catchPhrase),
      bs: Value(bs),
    );
  }

  factory Company.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Company(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      catchPhrase: serializer.fromJson<String>(json['catchPhrase']),
      bs: serializer.fromJson<String>(json['bs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'catchPhrase': serializer.toJson<String>(catchPhrase),
      'bs': serializer.toJson<String>(bs),
    };
  }

  Company copyWith({int? id, String? name, String? catchPhrase, String? bs}) =>
      Company(
        id: id ?? this.id,
        name: name ?? this.name,
        catchPhrase: catchPhrase ?? this.catchPhrase,
        bs: bs ?? this.bs,
      );
  Company copyWithCompanion(CompaniesCompanion data) {
    return Company(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      catchPhrase: data.catchPhrase.present
          ? data.catchPhrase.value
          : this.catchPhrase,
      bs: data.bs.present ? data.bs.value : this.bs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Company(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('catchPhrase: $catchPhrase, ')
          ..write('bs: $bs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, catchPhrase, bs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Company &&
          other.id == this.id &&
          other.name == this.name &&
          other.catchPhrase == this.catchPhrase &&
          other.bs == this.bs);
}

class CompaniesCompanion extends UpdateCompanion<Company> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> catchPhrase;
  final Value<String> bs;
  const CompaniesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.catchPhrase = const Value.absent(),
    this.bs = const Value.absent(),
  });
  CompaniesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String catchPhrase,
    required String bs,
  }) : name = Value(name),
       catchPhrase = Value(catchPhrase),
       bs = Value(bs);
  static Insertable<Company> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? catchPhrase,
    Expression<String>? bs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (catchPhrase != null) 'catch_phrase': catchPhrase,
      if (bs != null) 'bs': bs,
    });
  }

  CompaniesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? catchPhrase,
    Value<String>? bs,
  }) {
    return CompaniesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (catchPhrase.present) {
      map['catch_phrase'] = Variable<String>(catchPhrase.value);
    }
    if (bs.present) {
      map['bs'] = Variable<String>(bs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompaniesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('catchPhrase: $catchPhrase, ')
          ..write('bs: $bs')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressIdMeta = const VerificationMeta(
    'addressId',
  );
  @override
  late final GeneratedColumn<int> addressId = GeneratedColumn<int>(
    'address_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES addresses (id)',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES companies (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    username,
    email,
    phone,
    website,
    addressId,
    companyId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
      );
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('address_id')) {
      context.handle(
        _addressIdMeta,
        addressId.isAcceptableOrUnknown(data['address_id']!, _addressIdMeta),
      );
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      )!,
      addressId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}address_id'],
      ),
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final int userId;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final int? addressId;
  final int? companyId;
  const User({
    required this.id,
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    this.addressId,
    this.companyId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['website'] = Variable<String>(website);
    if (!nullToAbsent || addressId != null) {
      map['address_id'] = Variable<int>(addressId);
    }
    if (!nullToAbsent || companyId != null) {
      map['company_id'] = Variable<int>(companyId);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      username: Value(username),
      email: Value(email),
      phone: Value(phone),
      website: Value(website),
      addressId: addressId == null && nullToAbsent
          ? const Value.absent()
          : Value(addressId),
      companyId: companyId == null && nullToAbsent
          ? const Value.absent()
          : Value(companyId),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      website: serializer.fromJson<String>(json['website']),
      addressId: serializer.fromJson<int?>(json['addressId']),
      companyId: serializer.fromJson<int?>(json['companyId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'website': serializer.toJson<String>(website),
      'addressId': serializer.toJson<int?>(addressId),
      'companyId': serializer.toJson<int?>(companyId),
    };
  }

  User copyWith({
    int? id,
    int? userId,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
    Value<int?> addressId = const Value.absent(),
    Value<int?> companyId = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    username: username ?? this.username,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    website: website ?? this.website,
    addressId: addressId.present ? addressId.value : this.addressId,
    companyId: companyId.present ? companyId.value : this.companyId,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      website: data.website.present ? data.website.value : this.website,
      addressId: data.addressId.present ? data.addressId.value : this.addressId,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('addressId: $addressId, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    username,
    email,
    phone,
    website,
    addressId,
    companyId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.username == this.username &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.website == this.website &&
          other.addressId == this.addressId &&
          other.companyId == this.companyId);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<String> username;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> website;
  final Value<int?> addressId;
  final Value<int?> companyId;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.website = const Value.absent(),
    this.addressId = const Value.absent(),
    this.companyId = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
    this.addressId = const Value.absent(),
    this.companyId = const Value.absent(),
  }) : userId = Value(userId),
       name = Value(name),
       username = Value(username),
       email = Value(email),
       phone = Value(phone),
       website = Value(website);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? website,
    Expression<int>? addressId,
    Expression<int>? companyId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (website != null) 'website': website,
      if (addressId != null) 'address_id': addressId,
      if (companyId != null) 'company_id': companyId,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? name,
    Value<String>? username,
    Value<String>? email,
    Value<String>? phone,
    Value<String>? website,
    Value<int?>? addressId,
    Value<int?>? companyId,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      addressId: addressId ?? this.addressId,
      companyId: companyId ?? this.companyId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<int>(addressId.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('addressId: $addressId, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GeosTable geos = $GeosTable(this);
  late final $AddressesTable addresses = $AddressesTable(this);
  late final $CompaniesTable companies = $CompaniesTable(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    geos,
    addresses,
    companies,
    users,
  ];
}

typedef $$GeosTableCreateCompanionBuilder =
    GeosCompanion Function({
      Value<int> id,
      required double lat,
      required double lng,
    });
typedef $$GeosTableUpdateCompanionBuilder =
    GeosCompanion Function({
      Value<int> id,
      Value<double> lat,
      Value<double> lng,
    });

final class $$GeosTableReferences
    extends BaseReferences<_$AppDatabase, $GeosTable, Geo> {
  $$GeosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AddressesTable, List<Address>>
  _addressesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.addresses,
    aliasName: $_aliasNameGenerator(db.geos.id, db.addresses.geoId),
  );

  $$AddressesTableProcessedTableManager get addressesRefs {
    final manager = $$AddressesTableTableManager(
      $_db,
      $_db.addresses,
    ).filter((f) => f.geoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_addressesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GeosTableFilterComposer extends Composer<_$AppDatabase, $GeosTable> {
  $$GeosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> addressesRefs(
    Expression<bool> Function($$AddressesTableFilterComposer f) f,
  ) {
    final $$AddressesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.geoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableFilterComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GeosTableOrderingComposer extends Composer<_$AppDatabase, $GeosTable> {
  $$GeosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GeosTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeosTable> {
  $$GeosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  Expression<T> addressesRefs<T extends Object>(
    Expression<T> Function($$AddressesTableAnnotationComposer a) f,
  ) {
    final $$AddressesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.geoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableAnnotationComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GeosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GeosTable,
          Geo,
          $$GeosTableFilterComposer,
          $$GeosTableOrderingComposer,
          $$GeosTableAnnotationComposer,
          $$GeosTableCreateCompanionBuilder,
          $$GeosTableUpdateCompanionBuilder,
          (Geo, $$GeosTableReferences),
          Geo,
          PrefetchHooks Function({bool addressesRefs})
        > {
  $$GeosTableTableManager(_$AppDatabase db, $GeosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
              }) => GeosCompanion(id: id, lat: lat, lng: lng),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double lat,
                required double lng,
              }) => GeosCompanion.insert(id: id, lat: lat, lng: lng),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GeosTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({addressesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (addressesRefs) db.addresses],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (addressesRefs)
                    await $_getPrefetchedData<Geo, $GeosTable, Address>(
                      currentTable: table,
                      referencedTable: $$GeosTableReferences
                          ._addressesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GeosTableReferences(db, table, p0).addressesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.geoId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GeosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GeosTable,
      Geo,
      $$GeosTableFilterComposer,
      $$GeosTableOrderingComposer,
      $$GeosTableAnnotationComposer,
      $$GeosTableCreateCompanionBuilder,
      $$GeosTableUpdateCompanionBuilder,
      (Geo, $$GeosTableReferences),
      Geo,
      PrefetchHooks Function({bool addressesRefs})
    >;
typedef $$AddressesTableCreateCompanionBuilder =
    AddressesCompanion Function({
      Value<int> id,
      required String street,
      required String suite,
      required String city,
      required String zipcode,
      Value<int?> geoId,
    });
typedef $$AddressesTableUpdateCompanionBuilder =
    AddressesCompanion Function({
      Value<int> id,
      Value<String> street,
      Value<String> suite,
      Value<String> city,
      Value<String> zipcode,
      Value<int?> geoId,
    });

final class $$AddressesTableReferences
    extends BaseReferences<_$AppDatabase, $AddressesTable, Address> {
  $$AddressesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GeosTable _geoIdTable(_$AppDatabase db) =>
      db.geos.createAlias($_aliasNameGenerator(db.addresses.geoId, db.geos.id));

  $$GeosTableProcessedTableManager? get geoId {
    final $_column = $_itemColumn<int>('geo_id');
    if ($_column == null) return null;
    final manager = $$GeosTableTableManager(
      $_db,
      $_db.geos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_geoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$UsersTable, List<User>> _usersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.users,
    aliasName: $_aliasNameGenerator(db.addresses.id, db.users.addressId),
  );

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.addressId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AddressesTableFilterComposer
    extends Composer<_$AppDatabase, $AddressesTable> {
  $$AddressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get suite => $composableBuilder(
    column: $table.suite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zipcode => $composableBuilder(
    column: $table.zipcode,
    builder: (column) => ColumnFilters(column),
  );

  $$GeosTableFilterComposer get geoId {
    final $$GeosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.geoId,
      referencedTable: $db.geos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeosTableFilterComposer(
            $db: $db,
            $table: $db.geos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> usersRefs(
    Expression<bool> Function($$UsersTableFilterComposer f) f,
  ) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.addressId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AddressesTableOrderingComposer
    extends Composer<_$AppDatabase, $AddressesTable> {
  $$AddressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get suite => $composableBuilder(
    column: $table.suite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zipcode => $composableBuilder(
    column: $table.zipcode,
    builder: (column) => ColumnOrderings(column),
  );

  $$GeosTableOrderingComposer get geoId {
    final $$GeosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.geoId,
      referencedTable: $db.geos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeosTableOrderingComposer(
            $db: $db,
            $table: $db.geos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AddressesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AddressesTable> {
  $$AddressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get suite =>
      $composableBuilder(column: $table.suite, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get zipcode =>
      $composableBuilder(column: $table.zipcode, builder: (column) => column);

  $$GeosTableAnnotationComposer get geoId {
    final $$GeosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.geoId,
      referencedTable: $db.geos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeosTableAnnotationComposer(
            $db: $db,
            $table: $db.geos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> usersRefs<T extends Object>(
    Expression<T> Function($$UsersTableAnnotationComposer a) f,
  ) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.addressId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AddressesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AddressesTable,
          Address,
          $$AddressesTableFilterComposer,
          $$AddressesTableOrderingComposer,
          $$AddressesTableAnnotationComposer,
          $$AddressesTableCreateCompanionBuilder,
          $$AddressesTableUpdateCompanionBuilder,
          (Address, $$AddressesTableReferences),
          Address,
          PrefetchHooks Function({bool geoId, bool usersRefs})
        > {
  $$AddressesTableTableManager(_$AppDatabase db, $AddressesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AddressesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AddressesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AddressesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> street = const Value.absent(),
                Value<String> suite = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> zipcode = const Value.absent(),
                Value<int?> geoId = const Value.absent(),
              }) => AddressesCompanion(
                id: id,
                street: street,
                suite: suite,
                city: city,
                zipcode: zipcode,
                geoId: geoId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String street,
                required String suite,
                required String city,
                required String zipcode,
                Value<int?> geoId = const Value.absent(),
              }) => AddressesCompanion.insert(
                id: id,
                street: street,
                suite: suite,
                city: city,
                zipcode: zipcode,
                geoId: geoId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AddressesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({geoId = false, usersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (usersRefs) db.users],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (geoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.geoId,
                                referencedTable: $$AddressesTableReferences
                                    ._geoIdTable(db),
                                referencedColumn: $$AddressesTableReferences
                                    ._geoIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData<Address, $AddressesTable, User>(
                      currentTable: table,
                      referencedTable: $$AddressesTableReferences
                          ._usersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AddressesTableReferences(db, table, p0).usersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.addressId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AddressesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AddressesTable,
      Address,
      $$AddressesTableFilterComposer,
      $$AddressesTableOrderingComposer,
      $$AddressesTableAnnotationComposer,
      $$AddressesTableCreateCompanionBuilder,
      $$AddressesTableUpdateCompanionBuilder,
      (Address, $$AddressesTableReferences),
      Address,
      PrefetchHooks Function({bool geoId, bool usersRefs})
    >;
typedef $$CompaniesTableCreateCompanionBuilder =
    CompaniesCompanion Function({
      Value<int> id,
      required String name,
      required String catchPhrase,
      required String bs,
    });
typedef $$CompaniesTableUpdateCompanionBuilder =
    CompaniesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> catchPhrase,
      Value<String> bs,
    });

final class $$CompaniesTableReferences
    extends BaseReferences<_$AppDatabase, $CompaniesTable, Company> {
  $$CompaniesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<User>> _usersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.users,
    aliasName: $_aliasNameGenerator(db.companies.id, db.users.companyId),
  );

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.companyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CompaniesTableFilterComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catchPhrase => $composableBuilder(
    column: $table.catchPhrase,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bs => $composableBuilder(
    column: $table.bs,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usersRefs(
    Expression<bool> Function($$UsersTableFilterComposer f) f,
  ) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.companyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CompaniesTableOrderingComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catchPhrase => $composableBuilder(
    column: $table.catchPhrase,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bs => $composableBuilder(
    column: $table.bs,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CompaniesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompaniesTable> {
  $$CompaniesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get catchPhrase => $composableBuilder(
    column: $table.catchPhrase,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bs =>
      $composableBuilder(column: $table.bs, builder: (column) => column);

  Expression<T> usersRefs<T extends Object>(
    Expression<T> Function($$UsersTableAnnotationComposer a) f,
  ) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.companyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CompaniesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompaniesTable,
          Company,
          $$CompaniesTableFilterComposer,
          $$CompaniesTableOrderingComposer,
          $$CompaniesTableAnnotationComposer,
          $$CompaniesTableCreateCompanionBuilder,
          $$CompaniesTableUpdateCompanionBuilder,
          (Company, $$CompaniesTableReferences),
          Company,
          PrefetchHooks Function({bool usersRefs})
        > {
  $$CompaniesTableTableManager(_$AppDatabase db, $CompaniesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompaniesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompaniesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompaniesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> catchPhrase = const Value.absent(),
                Value<String> bs = const Value.absent(),
              }) => CompaniesCompanion(
                id: id,
                name: name,
                catchPhrase: catchPhrase,
                bs: bs,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String catchPhrase,
                required String bs,
              }) => CompaniesCompanion.insert(
                id: id,
                name: name,
                catchPhrase: catchPhrase,
                bs: bs,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CompaniesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (usersRefs) db.users],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData<Company, $CompaniesTable, User>(
                      currentTable: table,
                      referencedTable: $$CompaniesTableReferences
                          ._usersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CompaniesTableReferences(db, table, p0).usersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.companyId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CompaniesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompaniesTable,
      Company,
      $$CompaniesTableFilterComposer,
      $$CompaniesTableOrderingComposer,
      $$CompaniesTableAnnotationComposer,
      $$CompaniesTableCreateCompanionBuilder,
      $$CompaniesTableUpdateCompanionBuilder,
      (Company, $$CompaniesTableReferences),
      Company,
      PrefetchHooks Function({bool usersRefs})
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required int userId,
      required String name,
      required String username,
      required String email,
      required String phone,
      required String website,
      Value<int?> addressId,
      Value<int?> companyId,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> name,
      Value<String> username,
      Value<String> email,
      Value<String> phone,
      Value<String> website,
      Value<int?> addressId,
      Value<int?> companyId,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AddressesTable _addressIdTable(_$AppDatabase db) => db.addresses
      .createAlias($_aliasNameGenerator(db.users.addressId, db.addresses.id));

  $$AddressesTableProcessedTableManager? get addressId {
    final $_column = $_itemColumn<int>('address_id');
    if ($_column == null) return null;
    final manager = $$AddressesTableTableManager(
      $_db,
      $_db.addresses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_addressIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CompaniesTable _companyIdTable(_$AppDatabase db) => db.companies
      .createAlias($_aliasNameGenerator(db.users.companyId, db.companies.id));

  $$CompaniesTableProcessedTableManager? get companyId {
    final $_column = $_itemColumn<int>('company_id');
    if ($_column == null) return null;
    final manager = $$CompaniesTableTableManager(
      $_db,
      $_db.companies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  $$AddressesTableFilterComposer get addressId {
    final $$AddressesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableFilterComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompaniesTableFilterComposer get companyId {
    final $$CompaniesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.companies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompaniesTableFilterComposer(
            $db: $db,
            $table: $db.companies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  $$AddressesTableOrderingComposer get addressId {
    final $$AddressesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableOrderingComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompaniesTableOrderingComposer get companyId {
    final $$CompaniesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.companies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompaniesTableOrderingComposer(
            $db: $db,
            $table: $db.companies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  $$AddressesTableAnnotationComposer get addressId {
    final $$AddressesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableAnnotationComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompaniesTableAnnotationComposer get companyId {
    final $$CompaniesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.companies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompaniesTableAnnotationComposer(
            $db: $db,
            $table: $db.companies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({bool addressId, bool companyId})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> website = const Value.absent(),
                Value<int?> addressId = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                userId: userId,
                name: name,
                username: username,
                email: email,
                phone: phone,
                website: website,
                addressId: addressId,
                companyId: companyId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String name,
                required String username,
                required String email,
                required String phone,
                required String website,
                Value<int?> addressId = const Value.absent(),
                Value<int?> companyId = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                username: username,
                email: email,
                phone: phone,
                website: website,
                addressId: addressId,
                companyId: companyId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({addressId = false, companyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (addressId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.addressId,
                                referencedTable: $$UsersTableReferences
                                    ._addressIdTable(db),
                                referencedColumn: $$UsersTableReferences
                                    ._addressIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (companyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.companyId,
                                referencedTable: $$UsersTableReferences
                                    ._companyIdTable(db),
                                referencedColumn: $$UsersTableReferences
                                    ._companyIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({bool addressId, bool companyId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GeosTableTableManager get geos => $$GeosTableTableManager(_db, _db.geos);
  $$AddressesTableTableManager get addresses =>
      $$AddressesTableTableManager(_db, _db.addresses);
  $$CompaniesTableTableManager get companies =>
      $$CompaniesTableTableManager(_db, _db.companies);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
}
