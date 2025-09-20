// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteEmpty extends FavoriteState {
  const FavoriteEmpty();

  @override
  List<Object> get props => [];
}

class FavoriteLoading extends FavoriteState {
  const FavoriteLoading();

  @override
  List<Object> get props => [];
}

class FavoriteLoaded extends FavoriteState {
  final List<UserEntity> personList;

  const FavoriteLoaded(this.personList);

  @override
  List<Object> get props => [personList];
}
