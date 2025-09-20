import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/core/di/injection.dart';
import 'package:testovoe/feature/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:testovoe/feature/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:testovoe/feature/presentation/bloc/users_list_bloc/users_list_bloc.dart';
import 'package:testovoe/feature/presentation/bloc/setting_bloc/setting_bloc.dart';
import 'package:testovoe/feature/presentation/pages/navigation_page.dart';
import 'package:testovoe/l10n/app_localizations.dart';
import 'package:testovoe/resources/ui_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<NavigationBloc>()..add(NavigationInitEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<UsersListBloc>()..add(UsersListInit()),
        ),
        BlocProvider(
          create: (context) => getIt<SettingBloc>()..add(SettingModeInit()),
        ),
        BlocProvider(
          create: (context) => getIt<FavoriteBloc>()..add(FavoriteInit()),
        ),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state is SettingModeState
                ? state.nightMode
                      ? ThemeMode.dark
                      : ThemeMode.light
                : ThemeMode.dark,
            theme: UIThemes.lightTheme(),
            darkTheme: UIThemes.darkTheme(),
            home: NavigationPage(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
