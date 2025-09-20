import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/feature/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:testovoe/feature/presentation/pages/favorite_screen.dart';
import 'package:testovoe/feature/presentation/pages/user_screen.dart';
import 'package:testovoe/feature/presentation/pages/setting_screen.dart';
import 'package:testovoe/feature/presentation/widgets/bottom_navigation_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final bloc = context.read<NavigationBloc>();
        if (state is NavigationScreenState) {
          return Scaffold(
            bottomNavigationBar: BottomNaviBar(
              currentIndex: state.currentIndex,
              onItemTapped: (index) =>
                  bloc.add(NavigationOnItemTappedEvent(index: index)),
            ),
            body: PageView(
              controller: state.pageController,
              onPageChanged: (index) =>
                  bloc.add(NavigationOnPageChangedEvent(index: index)),
              children: const [HomePage(), FavoriteScreen(), SettingScreen()],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
