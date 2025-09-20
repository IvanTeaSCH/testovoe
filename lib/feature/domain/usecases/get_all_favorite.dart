import 'package:injectable/injectable.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/domain/repositories/user_repository.dart';

@injectable
class GetAllFavoritePersons {
  final UserRepository personRepository;

  GetAllFavoritePersons(this.personRepository);

  Future<List<UserEntity>> call() async {
    return await personRepository.getAllFavorite();
  }
}
