import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/presentation/bloc/users_list_bloc/users_list_bloc.dart';
import 'package:testovoe/feature/presentation/widgets/custom_search_delegate.dart';
import 'package:testovoe/l10n/app_localizations.dart';
import 'package:testovoe/resources/ui_themes.dart';

import 'user_card_widget.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return BlocBuilder<UsersListBloc, UsersState>(
      builder: (context, state) {
        final bloc = context.read<UsersListBloc>();
        List<UserEntity> users = [];
        if (state is UsersLoading) {
          return _loadingIndicator(appLocale, context);
        } else if (state is PersonLoaded) {
          users = state.usersList;
        } else if (state is UserError) {
          return Text(
            state.message,
            style: TextStyle(color: Colors.white, fontSize: 25),
          );
        }

        final theme = UIThemes.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(appLocale.users),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                color: theme.textPrimary,
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                      users: users,
                      searchLabel: appLocale.searchForUsers,
                    ),
                  );
                },
              ),
            ],
          ),
          body: RefreshIndicator(
            color: theme.divider,
            onRefresh: () async {
              bloc.add(UsersListloadEvent());
            },
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              controller: state.scrollController,
              itemBuilder: (context, index) {
                return UserCardWidget(
                  user: users[index],
                  onFavorite: (user) {
                    bloc.add(OnFavoriteEvent(user: user));
                  },
                );
              },
              separatorBuilder: (_, __) => Divider(),
              itemCount: users.length,
            ),
          ),
        );
      },
    );
  }

  Widget _loadingIndicator(AppLocalizations appLocale, BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appLocale.users)),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
