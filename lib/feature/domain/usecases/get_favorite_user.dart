import 'package:injectable/injectable.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/domain/repositories/user_repository.dart';

@injectable
class GetFavoriteUsers {
  final UserRepository personRepository;

  GetFavoriteUsers(this.personRepository);

  Stream<List<UserEntity>> call() {
    return personRepository.getFavoriteUsers();
  }
}
