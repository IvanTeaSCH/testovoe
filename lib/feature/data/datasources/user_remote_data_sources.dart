import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:testovoe/core/error/exeption.dart';
import 'package:testovoe/feature/data/models/user_model.dart';

abstract class PersonRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
}

@LazySingleton(as: PersonRemoteDataSource)
class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getAllUsers() =>
      _getUserFromUrl("https://jsonplaceholder.typicode.com/users");

  Future<List<UserModel>> _getUserFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final users = json.decode(response.body);
      return (users as List).map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw ServerException();
    }
  }
}
