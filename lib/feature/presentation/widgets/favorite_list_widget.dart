import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:testovoe/l10n/app_localizations.dart';

import 'user_card_widget.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        final bloc = context.read<FavoriteBloc>();
        List<UserEntity> persons = [];
        if (state is FavoriteLoading) {
          return _loadingIndicator();
        } else if (state is FavoriteEmpty) {
          return _emptyPage(appLocale.usersFavoriteScreenEmpty);
        } else if (state is FavoriteLoaded) {
          persons = state.personList;
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            return UserCardWidget(
              user: persons[index],
              onFavorite: (person) {
                bloc.add(OnFavoriteEvent(person: person));
              },
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: persons.length,
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _emptyPage(String text) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(child: Text(text)),
    );
  }
}
