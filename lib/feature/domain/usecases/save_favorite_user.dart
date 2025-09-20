import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/domain/repositories/user_repository.dart';

@injectable
class SaveFavoriteUser {
  final UserRepository personRepository;

  SaveFavoriteUser(this.personRepository);

  Future<void> call(UserParams params) async {
    await personRepository.saveFavoriteUser(params.person);
  }
}

class UserParams extends Equatable {
  final UserEntity person;

  const UserParams({required this.person});

  @override
  List<Object?> get props => [person];
}
