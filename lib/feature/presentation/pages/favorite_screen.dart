import 'package:flutter/material.dart';
import 'package:testovoe/feature/presentation/widgets/favorite_list_widget.dart';
import 'package:testovoe/l10n/app_localizations.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocale.favorite)),
      body: FavoriteList(),
    );
  }
}
