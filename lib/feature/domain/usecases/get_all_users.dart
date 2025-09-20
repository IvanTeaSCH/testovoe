import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:testovoe/core/error/failure.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/domain/repositories/user_repository.dart';

@injectable
class GetAllUsers {
  final UserRepository personRepository;

  GetAllUsers(this.personRepository);

  Future<Either<Failure, List<UserEntity>>> call() async {
    return await personRepository.getAllPersons();
  }
}
