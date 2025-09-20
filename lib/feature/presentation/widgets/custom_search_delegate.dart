import 'package:flutter/material.dart';
import 'package:testovoe/feature/domain/entities/user_entity.dart';
import 'package:testovoe/feature/presentation/pages/user_detail_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.users, required String searchLabel})
    : super(searchFieldLabel: searchLabel);

  final List<UserEntity> users;

  final _suggestions = ["Leanne", "Ervin", "Bauch"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back_outlined),
      tooltip: 'Back',
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<UserEntity> searchUsers = _searchUsersByName(query);
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) => _result(searchUsers[index], context),
      separatorBuilder: (_, __) => Divider(),
      itemCount: searchUsers.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      List<UserEntity> searchUsers = _searchUsersByName(query);
      return ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) => _result(searchUsers[index], context),
        separatorBuilder: (_, __) => Divider(),
        itemCount: searchUsers.length,
      );
    }
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            query = _suggestions[index];
          },
          child: Text(
            _suggestions[index],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        );
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: _suggestions.length,
    );
  }

  List<UserEntity> _searchUsersByName(String query) {
    final lowerQuery = query.toLowerCase();
    return users
        .where((user) => user.name.toLowerCase().contains(lowerQuery))
        .toList();
  }

  Widget _result(UserEntity user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserDetailPage(user: user)),
        );
      },
      child: Text(
        user.name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}
