import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/feature/presentation/bloc/setting_bloc/setting_bloc.dart';
import 'package:testovoe/l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        final bloc = context.read<SettingBloc>();
        return Scaffold(
          appBar: AppBar(title: Text(appLocale.setting)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appLocale.nightMode),
                CupertinoSwitch(
                  value: state is SettingModeState
                      ? state.nightMode
                            ? true
                            : false
                      : true,
                  onChanged: (_) {
                    bloc.add(SettingChangeModeEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
