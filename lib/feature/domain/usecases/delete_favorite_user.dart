import 'package:injectable/injectable.dart';
import 'package:testovoe/feature/domain/repositories/user_repository.dart';
import 'package:testovoe/feature/domain/usecases/save_favorite_user.dart';

@injectable
class DeleteFavoriteUser {
  final UserRepository personRepository;

  DeleteFavoriteUser(this.personRepository);

  Future<void> call(UserParams params) async {
    await personRepository.deleteFavoritePerson(params.person);
  }
}
