import 'package:flutter/material.dart';

import '../widgets/users_list_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return UsersList();
  }
}
